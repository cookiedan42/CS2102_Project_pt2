/*
The following routines in this section do not have return values, 
and should be implemented as PostgreSQL procedures 
(https://www.postgresql.org/docs/14/sql-createprocedure.html).
*/

/*
(1) place_order( 
    user_id INTEGER, 
    coupon_id INTEGER, 
    shipping_address TEXT, 
    shop_ids INTEGER[],
    product_ids INTEGER[], 
    sell_timestamps TIMESTAMP[], 
    quantities INTEGER[], 
    shipping_costs NUMERIC[] )

 Places an order by a user for selected product listings
 DATATYPE[] refers to an array of DATATYPE
 Each orderline will have one entry in each array, 
    e.g. shop_ids[i] refers to the shop_id of orderline i
 The quantity sold for each product listing involved should be updated after the order is placed successfully
 The order’s payment_amount should be calculated as the sum of (price * quantity + shipping_cost) for each purchased product
 The coupon_id is optional; 
    it is NULL if the user does not use a coupon
o If a coupon is used, the payment_amount should be adjusted
*/
CREATE OR REPLACE PROCEDURE place_order( 
    user_id INTEGER, 
    coupon_id INTEGER, 
    shipping_address TEXT, 
    shop_ids INTEGER[],
    product_ids INTEGER[], 
    sell_timestamps TIMESTAMP[], 
    quantities INTEGER[], 
    shipping_costs NUMERIC[] )
AS $$ 
DECLARE
    Order_ID        INTEGER;
    Original_Price  NUMERIC:=0.0  ;
    discount        NUMERIC:=0.0  ;
BEGIN


-- create the order
INSERT into orders values
    (DEFAULT, user_id, coupon_id, shipping_address, 0);
Order_ID:= LASTVAL();

-- for each group of entries
for i in 1..array_length(shop_ids, 1) loop

    -- create orderline
    INSERT INTO orderline VALUES(
        Order_ID, 
        shop_ids[i], product_ids[i], sell_timestamps[i], 
        quantities[i], shipping_costs[i], 
        'being_processed', NULL );
    

    -- raise exception when minus fails?
    if (quantities[i] > (  SELECT quantity from sells 
        where shop_id = shop_ids[i]
            and product_id = product_ids[i]
            and sell_timestamp = sell_timestamps[i]
        ))
        then raise exception 'attempted to purchase more than available stock';
    end if;

    -- remove from sells
    UPDATE sells
        SET quantity = quantity - quantities[i]
        WHERE shop_id = shop_ids[i]
            and product_id = product_ids[i]
            and sell_timestamp = sell_timestamps[i];

    -- add to original price
    SELECT Original_Price + shipping_costs[i] + price*quantities[i] into Original_Price
        from sells 
        where shop_id = shop_ids[i] 
            and product_id = product_ids[i];
    
    /*
    raise info 'i: %', i;
    raise info 'shop_ids: %', shop_ids[i];
    raise info 'product_ids: %', product_ids[i];
    raise info 'sell_timestamps: %', sell_timestamps[i];
    raise info 'quantities: %', quantities[i];
    raise info 'shopping_costs: %', shipping_costs[i];
    */
end loop;

-- apply coupon

IF NOT coupon_id  IS NULL THEN
    select COALESCE(reward_amount,0) into discount 
    from coupon_batch 
    where id = coupon_id limit 1;
end if;


UPDATE orders 
SET payment_amount = Original_Price - discount
where id = Order_ID;

END;
$$LANGUAGE plpgsql;

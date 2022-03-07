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

$$LANGUAGE SQL;
/*
(2) review( 
    user_id INTEGER, 
    order_id INTEGER, 
    shop_id INTEGER, 
    product_id INTEGER, 
    sell_timestamp TIMESTAMP, 
    content TEXT, 
    rating INTEGER, 
    comment_timestamp TIMESTAMP)

 Creates a review by the given user for the particular ordered product
*/
CREATE OR REPLACE PROCEDURE review( 
    user_id INTEGER, 
    order_id INTEGER, 
    shop_id INTEGER, 
    product_id INTEGER, 
    sell_timestamp TIMESTAMP, 
    content TEXT, 
    rating INTEGER, 
    comment_timestamp TIMESTAMP)
AS $$ 

$$LANGUAGE SQL;

/*
(3) reply( 
    user_id INTEGER, 
    other_comment_id INTEGER, 
    content TEXT, 
    reply_timestamp TIMESTAMP )

 Creates a reply from user on another comment
*/
CREATE OR REPLACE PROCEDURE reply( 
    user_id INTEGER, 
    other_comment_id INTEGER, 
    content TEXT, 
    reply_timestamp TIMESTAMP )
AS $$ 

$$LANGUAGE SQL;

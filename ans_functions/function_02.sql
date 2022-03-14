/*
The following routines in this section have return values, 
and should be implemented as PostgreSQL functions 
(https://www.postgresql.org/docs/14/sql-createfunction.html).
*/


/*
(2) get_most_returned_products_from_manufacturer( manufacturer_id INTEGER, n INTEGER)
 Output: TABLE ( product_id INTEGER, product_name TEXT, return_rate NUMERIC(3, 2) )
 Obtains the N products from the provided manufacturer that have the highest return rate
(successfully refunded)
o Products are only successfully refunded if the refund_request status is ‘accepted’
o The output table may have fewer than N records if the manufacturer has produced
fewer than N products
 Return rate for a product is calculated as (sum of quantity successfully returned across all orders)
/ (sum of quantity delivered across all orders)
o The return rate should be a numeric value between 0.00 and 1.00, rounded off to the
nearest 2 decimal places
o If a product has never been ordered, its return_rate should default to 0.00
 Results should be ordered descending by return_rate
o In the case of a tie in return_rate, order them ascending by product_id
*/
CREATE OR REPLACE FUNCTION get_most_returned_products_from_manufacturer( manufacturer_id INTEGER, n INTEGER)
RETURNS TABLE ( product_id INTEGER, product_name TEXT, return_rate NUMERIC(3, 2) )
AS $$ 
    
    with 
    manu_products as (
        select * from Product 
        where manufacturer = manufacturer_id
    ),
    sold as (
        select product_id, sum(quantity) as sold_quantity 
        from orderline 
        where status = 'delivered'
            and product_id in (select id from manu_products)
        group by product_id
    ),
    refunded as (
        select product_id, sum(quantity) as refund_quantity
        from refund_request
        where status = 'accepted' 
            and product_id in (select id from manu_products)
        group by product_id
    )
    select manu_products.id, manu_products.name, 
        cast(
            Coalesce(refund_quantity, 0) /  
            Coalesce(sold_quantity  , 1) 
            as NUMERIC(3, 2)
            ) as return_rate
    from manu_products
        left join sold on manu_products.id = sold.product_id
        left join refunded on manu_products.id = refunded.product_id
    ORDER BY
        return_rate DESC,
        manu_products.id ASC
    LIMIT n

$$LANGUAGE SQL;

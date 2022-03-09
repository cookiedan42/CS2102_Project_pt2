/*
The following routines in this section do not have return values, 
and should be implemented as PostgreSQL procedures 
(https://www.postgresql.org/docs/14/sql-createprocedure.html).
*/



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

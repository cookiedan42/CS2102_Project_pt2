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
DECLARE
    order_id_arg            INTEGER := order_id;
    shop_id_arg             INTEGER := shop_id;
    product_id_arg          INTEGER := product_id;
    sell_timestamp_arg      TIMESTAMP := sell_timestamp;
    
    comment_id              INTEGER;
BEGIN
    -- check for existing review for this orderline
    SELECT id into comment_id 
    FROM review r 
    WHERE r.order_id = order_id_arg
        AND r.shop_id = shop_id_arg
        AND r.product_id = product_id_arg
        AND r.sell_timestamp = sell_timestamp_arg
    ;
    if comment_id ISNULL
    THEN
        -- create comment and review

        -- ensure that serial id sequence is correct
        PERFORM setval('Comment_id_seq', max(id)) FROM Comment;

        insert into Comment VALUES (DEFAULT, user_id);
        SELECT CURRVAL('Comment_id_seq') into comment_id;
        insert into Review values 
            (comment_id, 
            order_id_arg, shop_id_arg, product_id_arg, sell_timestamp_arg);
    end if;

    -- create review version
    INSERT INTO review_version VALUES
        (comment_id, comment_timestamp, content, rating);



END;
$$LANGUAGE plpgsql;

/*
The following routines in this section have return values, 
and should be implemented as PostgreSQL functions 
(https://www.postgresql.org/docs/14/sql-createfunction.html).
*/
/*
(1) view_comments( shop_id INTEGER, product_id INTEGER, sell_timestamp TIMESTAMP )
 Output: TABLE ( username TEXT, content TEXT, rating INTEGER, comment_timestamp
TIMESTAMP )
 Retrieves info about all comments related to a product listing (an instance of the Sells relation)
o This includes reviews, and also replies to the reviews for that product listing
 If the comment is a reply, the rating should be NULL for that row
 If a comment has multiple versions, return only the latest version
 If a comment belongs to a deleted user, display their name as ‘A Deleted User’ rather than their
original username


 Results should be ordered ascending by the timestamp of the latest version of each comment
o In the case of a tie in comment_timestamp, order them ascending by comment_id
*/
CREATE OR REPLACE FUNCTION view_comments( shop_id INTEGER, product_id INTEGER, sell_timestamp TIMESTAMP )
RETURNS TABLE ( username TEXT, content TEXT, rating INTEGER, comment_timestamp TIMESTAMP )
AS $$ 

    WITH 
    review_section as (
        SELECT * from 
        review join review_version on review.review_id
        group by 
    )
$$LANGUAGE SQL;

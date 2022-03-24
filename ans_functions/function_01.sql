/*
The following routines in this section have return values, 
and should be implemented as PostgreSQL functions 
(https://www.postgresql.org/docs/14/sql-createfunction.html).
*/
/*
(1) view_comments( shop_id INTEGER, product_id INTEGER, sell_timestamp TIMESTAMP )
 Output: TABLE ( username TEXT, content TEXT, rating INTEGER, comment_timestamp TIMESTAMP )
 Retrieves info about all comments related to a product listing (an instance of the Sells relation)
o This includes reviews, and also replies to the reviews for that product listing
 If the comment is a reply, the rating should be NULL for that row
 If a comment has multiple versions, return only the latest version
 If a comment belongs to a deleted user, display their name as ‘A Deleted User’ rather than their
original username


 Results should be ordered ascending by the timestamp of the latest version of each comment
o In the case of a tie in comment_timestamp, order them ascending by comment_id
*/
CREATE OR REPLACE FUNCTION view_comments( input_shop_id INTEGER, input_product_id INTEGER, input_sell_timestamp TIMESTAMP )
RETURNS TABLE ( username TEXT, content TEXT, rating INTEGER, comment_timestamp TIMESTAMP )
AS $$ 


    WITH 
    RECURSIVE
    correct_review as (
        select r0.review_id as id, r0.content, r0.rating, r0.review_timestamp as comment_timestamp
        from review_version as r0
            natural join (
                SELECT review_id, max(review_timestamp) as review_timestamp 
                from review_version 
                group by review_id) as r
            join review on review.id = r0.review_id
        where   review.shop_id = input_shop_id
            and review.product_id = input_product_id
            and review.sell_timestamp = input_sell_timestamp
    ),
    recursive_reply as (
        select id from correct_review
        UNION
        select reply.id 
        from reply, recursive_reply
        where reply.other_comment_id = recursive_reply.id
    ),
    correct_reply as (
        select r0.reply_id as id, r0.content, cast(null as Integer) as rating , r0.reply_timestamp as comment_timestamp
        from reply_version as r0
            natural join (
                SELECT reply_id, max(reply_timestamp) as reply_timestamp 
                from reply_version
                group by reply_id) as r1
            join reply on reply.id = r0.reply_id,
            recursive_reply
        where reply.other_comment_id = recursive_reply.id
    ),
    correct_comments as (
        SELECT * from correct_review NATURAL JOIN comment
        UNION
        SELECT * from correct_reply NATURAL JOIN comment
    )
    SELECT 
        case when users.account_closed then 'A Deleted User' else users.name end,
        correct_comments.content,
        correct_comments.rating,
        correct_comments.comment_timestamp
    FROM correct_comments
        LEFT JOIN users
            ON correct_comments.user_id = users.id
    ORDER BY correct_comments.comment_timestamp ASC,
        correct_comments.id ASC;


$$ LANGUAGE sql;
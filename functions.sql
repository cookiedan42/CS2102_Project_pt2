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

$$LANGUAGE SQL;


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

$$LANGUAGE SQL;


/*
(3) get_worst_shops( n INTEGER )
 Output: TABLE( shop_id INTEGER, shop_name TEXT, num_negative_indicators INTEGER )
 Finds the N worst shops, judging by the number of negative indicators that they have
 Each ordered product from that shop which has a refund request (regardless of status) is
considered as one negative indicator
o Multiple refund requests on the same orderline only count as one negative indicator
 Each shop complaint (regardless of status) is considered as one negative indicator
 Each delivery complaint (regardless of status) for a delivered product by that shop is considered
as one negative indicator
o Multiple complaints on the same orderline only count as one negative indicator
 Each 1-star review is considered as one negative indicator
o Only consider the latest version of the review
o i.e., if there is a previous version that is 1-star but the latest version is 2-star, then we
do not consider this as a negative indicator
 Results should be ordered descending by num_negative_indicators (the total number of all
negative indicators listed above)
o In the case of a tie in num_negative_indicators, order them ascending by shop_id
*/
CREATE OR REPLACE FUNCTION get_worst_shops( n INTEGER )
RETURNS TABLE( shop_id INTEGER, shop_name TEXT, num_negative_indicators INTEGER )
AS $$ 

$$LANGUAGE SQL;


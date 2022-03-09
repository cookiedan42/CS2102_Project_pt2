/*
The following routines in this section have return values, 
and should be implemented as PostgreSQL functions 
(https://www.postgresql.org/docs/14/sql-createfunction.html).
*/


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
    SELECT ( 1, 'shop_name' , 1 )
$$LANGUAGE SQL;


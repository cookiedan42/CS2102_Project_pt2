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

with 

-- Each ordered product from that shop which has a refund request (regardless of status) 
-- is considered as one negative indicator
-- Multiple refund requests on the same orderline only count as one negative indicator
refund_indicator as ( 
    select shop_id, 1 as indicator_type
    from refund_request 
    group by order_id, shop_id, product_id, sell_timestamp
),

-- Each shop complaint (regardless of status) 
-- is considered as one negative indicator
shop_indicator as (
    SELECT shop_id, 2 as indicator_type
    FROM shop_complaint
),

-- Each delivery complaint (regardless of status) for a delivered product by that shop 
-- is considered as one negative indicator
-- Multiple complaints on the same orderline only count as one negative indicator
delivery_indicator as (
    SELECT shop_id, 3  as indicator_type
    FROM delivery_complaint
    group by order_id, shop_id, product_id, sell_timestamp
),

-- Each 1-star review is considered as one negative indicator
-- Only consider the latest version of the review
newest_reviews as (
    select review_id, max(review_timestamp) as review_timestamp
    from review_version
    group by review_id
),
star_indicator as (
    select shop_id, 4 as indicator_type
    from newest_reviews
        left join review_version
            on review_version.review_timestamp = newest_reviews.review_timestamp
            and review_version.review_id = newest_reviews.review_id
        left join review
            on review.id = newest_reviews.review_id
    where rating = 1
    group by order_id, shop_id, product_id, sell_timestamp
),
all_indicator as (
    select * from refund_indicator
        union all
    select * from shop_indicator
        union ALL
    select * from delivery_indicator
        union ALL
    select * from star_indicator
)
select shop.id, shop.name, count(*) as num_negative_indicators
from all_indicator
    left join shop on all_indicator.shop_id = shop.id
group by shop.id,shop.name
order by num_negative_indicators desc,
    shop.id ASC
limit n
$$LANGUAGE SQL;


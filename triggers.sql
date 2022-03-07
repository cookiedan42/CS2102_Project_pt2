/*
https://www.postgresql.org/docs/14/sql-createtrigger.html
*/


/*
Product related:
(1) Each shop should sell at least one product.
*/
CREATE OR REPLACE TRIGGER shop_minimum_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION shop_minimum_func();

CREATE OR REPLACE FUNCTION shop_minimum_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Order related:
(2) An order must involve one or more products from one or more shops.
*/
CREATE OR REPLACE TRIGGER order_minimum_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION order_minimum_func();

CREATE OR REPLACE FUNCTION order_minimum_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Coupon related:
(3) A coupon can only be used on an order whose total amount (before the coupon is applied) exceeds
the minimum order amount.
*/
CREATE OR REPLACE TRIGGER coumpon_minimum_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION coumpon_minimum_func();

CREATE OR REPLACE FUNCTION coumpon_minimum_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql

/*
Refund related:
(4) The refund quantity must not exceed the ordered quantity.
*/
CREATE OR REPLACE TRIGGER refund_maximum_quantity_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION refund_maximum_quantity_func();

CREATE OR REPLACE FUNCTION refund_maximum_quantity_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Refund related:
(5) The refund request date must be within 30 days of the delivery date.
*/
CREATE OR REPLACE TRIGGER refund_time_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION refund_time_func();

CREATE OR REPLACE FUNCTION refund_time_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Refund related:
(6) Refund request can only be made for a delivered product.
*/
CREATE OR REPLACE TRIGGER refund_delivered_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION refund_delivered_func();

CREATE OR REPLACE FUNCTION refund_delivered_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Comment related:
(7) A user can only make a product review for a product that they themselves purchased.
*/
CREATE OR REPLACE TRIGGER comment_purchased_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION comment_purchased_func();

CREATE OR REPLACE FUNCTION comment_purchased_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Comment related:
(8) A comment is either a review or a reply, not both (non-overlapping and covering).
*/
CREATE OR REPLACE TRIGGER comment_type_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION comment_type_func();

CREATE OR REPLACE FUNCTION comment_type_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Comment related:
(9) A reply has at least one reply version.
*/
CREATE OR REPLACE TRIGGER comment_reply_version_minimum_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION comment_reply_version_minimum_func();

CREATE OR REPLACE FUNCTION comment_reply_version_minimum_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Comment related:
(10) A review has at least one review version.
*/
CREATE OR REPLACE TRIGGER comment_review_version_minimum_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION comment_review_version_minimum_func();

CREATE OR REPLACE FUNCTION comment_review_version_minimum_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Complaint related:
(11) A delivery complaint can only be made when the product has been delivered.
*/
CREATE OR REPLACE TRIGGER complaint_delivered_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION complaint_delivered_func();

CREATE OR REPLACE FUNCTION complaint_delivered_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Complaint related:
(12) A complaint is either a delivery-related complaint, a shop-related complaint or a comment-related
complaint (non-overlapping and covering).
*/
CREATE OR REPLACE TRIGGER complaint_type_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION complaint_type_func();

CREATE OR REPLACE FUNCTION complaint_type_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql

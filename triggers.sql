/*
https://www.postgresql.org/docs/14/sql-createtrigger.html
*/


/*
Product related:
(1) Each shop should sell at least one product.
*/
CREATE OR REPLACE TRIGGER template_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Order related:
(2) An order must involve one or more products from one or more shops.
*/
CREATE OR REPLACE TRIGGER template_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
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
CREATE OR REPLACE TRIGGER template_trigger
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql

/*
Refund related:
(4) The refund quantity must not exceed the ordered quantity.
*/
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Refund related:
(5) The refund request date must be within 30 days of the delivery date.
*/
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Refund related:
(6) Refund request can only be made for a delivered product.
*/
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Comment related:
(7) A user can only make a product review for a product that they themselves purchased.
*/
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Comment related:
(8) A comment is either a review or a reply, not both (non-overlapping and covering).
*/
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Comment related:
(9) A reply has at least one reply version.
*/
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Comment related:
(10) A review has at least one review version.
*/
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql


/*
Complaint related:
(11) A delivery complaint can only be made when the product has been delivered.
*/
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
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
FOR EACH ROW EXECUTE FUNCTION template_trigger_func();

CREATE OR REPLACE FUNCTION template_trigger_func RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql

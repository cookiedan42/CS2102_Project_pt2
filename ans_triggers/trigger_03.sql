/*
Coupon related:
(3) A coupon can only be used on an order whose total amount (before the coupon is applied) exceeds
the minimum order amount.
*/
CREATE OR REPLACE FUNCTION coumpon_minimum_func() RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER coumpon_minimum_trigger
BEFORE DELETE ON shop /*syntax placeholder*/
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION coumpon_minimum_func();

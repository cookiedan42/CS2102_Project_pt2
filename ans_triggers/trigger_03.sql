/*
does EXCEED allow for equal?
*/


/*
Coupon related:
(3) A coupon can only be used on an order whose total amount (before the coupon is applied) 
exceeds the minimum order amount.
*/

CREATE OR REPLACE FUNCTION coupon_minimum_func() RETURNS TRIGGER
AS $$
BEGIN 
    IF NEW.payment_amount > ALL( SELECT  min_order_amount FROM coupon_batch WHERE id = NEW.coupon_id)
        THEN return NEW;
    ELSE
        raise exception 'order % does not have any orderlines',NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER coupon_minimum_trigger
AFTER INSERt ON orders
FOR EACH ROW EXECUTE FUNCTION coupon_minimum_func();

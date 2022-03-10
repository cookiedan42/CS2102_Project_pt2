/*
does EXCEED allow for equal?
*/

/*
Coupon related:
(3) A coupon can only be used on an order whose total amount 
(before the coupon is applied) exceeds the minimum order amount.
*/

CREATE CONSTRAINT TRIGGER coupon_minimum_trigger
AFTER INSERT ON orders
FOR EACH ROW EXECUTE FUNCTION coupon_minimum_func();


CREATE OR REPLACE FUNCTION coupon_minimum_func() RETURNS TRIGGER
AS $$
DECLARE
    coupon_min_order_amount NUMERIC;

BEGIN 
    IF NEW.coupon_id ISNULL
        THEN return NEW;
    END IF;

    SELECT min_order_amount into coupon_min_order_amount
        FROM coupon_batch 
        WHERE id = NEW.coupon_id
        LIMIT 1;


    IF NEW.payment_amount > coupon_min_order_amount
        THEN return NEW;
    ELSE
        raise exception 'order total amount does not exceed coupon minimum order amount';
    END IF;
END;
$$ LANGUAGE plpgsql;


/*
Order related:
(2) An order must involve one or more products from one or more shops.
*/


CREATE CONSTRAINT TRIGGER order_minimum_trigger
AFTER INSERT ON orders
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW 
EXECUTE FUNCTION order_minimum_func();

CREATE OR REPLACE FUNCTION order_minimum_func() RETURNS TRIGGER
AS $$
DECLARE
    hasOrderline    BOOLEAN;
BEGIN 
    hasOrderline := EXISTS( SELECT 1 FROM orderline WHERE NEW.id = orderline.order_id);
    IF (hasOrderline)
        THEN RETURN NEW;
    ELSE 
        raise exception 'order % does not have any orderlines',NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;


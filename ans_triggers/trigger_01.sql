
/*
Product related:
(1) Each shop should sell at least one product.
*/

CREATE CONSTRAINT TRIGGER shop_minimum_trigger
AFTER INSERT ON shop
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW
EXECUTE FUNCTION shop_minimum_func();

CREATE OR REPLACE FUNCTION shop_minimum_func() RETURNS TRIGGER 
AS $$
BEGIN 
    IF (EXISTS( SELECT 1 FROM sells WHERE NEW.id = sells.shop_id))
        THEN RETURN NEW;
    ELSE raise exception 'shop % does not sell anything',NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;


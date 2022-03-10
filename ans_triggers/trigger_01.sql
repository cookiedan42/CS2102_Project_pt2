
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
DECLARE
    hasProduct boolean;
BEGIN 
    hasProduct:= exists(SELECT * from sells where NEW.id = sells.shop_id);
    IF (hasProduct)
        THEN RETURN NEW;
    ELSE 
        raise exception 'shop % does not sell anything', NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;


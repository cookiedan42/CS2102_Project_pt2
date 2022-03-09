/*
Refund related:
(4) The refund quantity must not exceed the ordered quantity.
*/
CREATE OR REPLACE FUNCTION refund_maximum_quantity_func() RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER refund_maximum_quantity_trigger
BEFORE DELETE ON shop /*syntax placeholder*/
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION refund_maximum_quantity_func();

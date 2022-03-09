/*
Order related:
(2) An order must involve one or more products from one or more shops.
order must have some orderline
*/
CREATE OR REPLACE FUNCTION order_minimum_func() RETURNS TRIGGER
AS $$
BEGIN 
/*
if order exists and this is the last one, don't delete
*/
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER order_minimum_trigger
BEFORE UPDATE ON orderline /*syntax placeholder*/
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW 
EXECUTE FUNCTION order_minimum_func();

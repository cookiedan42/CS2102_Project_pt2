
/*
Comment related:
(7) A user can only make a product review for a product that they themselves purchased.
*/
CREATE OR REPLACE FUNCTION comment_purchased_func() RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER comment_purchased_trigger
BEFORE DELETE ON shop /*syntax placeholder*/
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION comment_purchased_func();

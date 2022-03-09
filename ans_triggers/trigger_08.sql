/*
Comment related:
(8) A comment is either a review or a reply, not both (non-overlapping and covering).
*/
CREATE OR REPLACE FUNCTION comment_type_func() RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER comment_type_trigger
BEFORE DELETE ON shop /*syntax placeholder*/
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION comment_type_func();

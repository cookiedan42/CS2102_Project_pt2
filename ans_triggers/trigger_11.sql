/*
Complaint related:
(11) A delivery complaint can only be made when the product has been delivered.
*/
CREATE OR REPLACE FUNCTION complaint_delivered_func() RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER complaint_delivered_trigger
BEFORE DELETE ON shop /*syntax placeholder*/
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION complaint_delivered_func();


/*
Complaint related:
(12) A complaint is either a delivery-related complaint, a shop-related complaint or a comment-related
complaint (non-overlapping and covering).
*/
CREATE OR REPLACE FUNCTION complaint_type_func() RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER complaint_type_trigger
BEFORE DELETE ON shop /*syntax placeholder*/
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION complaint_type_func();


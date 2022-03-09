
/*
Comment related:
(10) A review has at least one review version.
*/
CREATE OR REPLACE FUNCTION comment_review_version_minimum_func() RETURNS TRIGGER
AS $$
BEGIN 
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER comment_review_version_minimum_trigger
BEFORE DELETE ON shop /*syntax placeholder*/
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION comment_review_version_minimum_func();
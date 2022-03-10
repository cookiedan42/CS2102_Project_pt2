
/*
Comment related:
(10) A review has at least one review version.
*/
CREATE CONSTRAINT TRIGGER comment_review_version_minimum_trigger
AFTER INSERT ON review
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION comment_review_version_minimum_func();

CREATE OR REPLACE FUNCTION comment_review_version_minimum_func() RETURNS TRIGGER
AS $$
DECLARE
    version_count   INTEGER;
BEGIN
    SELECT 1 into version_count
    FROM review_version
    WHERE review_id = NEW.id
    LIMIT 1;

    IF version_count > 0
        THEN return NEW;
    ELSE 
        raise exception 'review cannot have no versions';
    END IF;
END;
$$ LANGUAGE plpgsql;


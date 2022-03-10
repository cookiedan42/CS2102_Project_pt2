/*
Comment related:
(9) A reply has at least one reply version.
*/

CREATE CONSTRAINT TRIGGER comment_reply_version_minimum_trigger
AFTER INSERT ON reply
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION comment_reply_version_minimum_func();

CREATE OR REPLACE FUNCTION comment_reply_version_minimum_func() RETURNS TRIGGER
AS $$
DECLARE
    version_count   INTEGER;
BEGIN
    SELECT 1 into version_count
    FROM reply_version
    WHERE reply_id = NEW.id
    LIMIT 1;

     IF version_count > 0
        THEN return NEW;
    ELSE 
        raise exception 'reply cannot have no versions';
    END IF;
END;
$$ LANGUAGE plpgsql;


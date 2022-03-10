/*
Comment related:
(8) A comment is either a review or a reply, not both (non-overlapping and covering).
*/

CREATE CONSTRAINT TRIGGER comment_type_trigger
AFTER INSERT ON comment
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION comment_type_func();

CREATE OR REPLACE FUNCTION comment_type_func() RETURNS TRIGGER
AS $$
DECLARE
    review_count    INTEGER;
    reply_count     INTEGER;
BEGIN 
    select count(*) into review_count from review where id = NEW.id;
    select count(*) into reply_count  from reply where id = NEW.id;

    IF (review_count + reply_count) = 1
        THEN return NEW;
    ELSE 
        raise exception '% reviews and replies share the same comment id of %',
            (review_count + reply_count), NEW.id;
    END IF;
END;
$$ LANGUAGE plpgsql;


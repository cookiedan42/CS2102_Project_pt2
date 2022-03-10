/*
Complaint related:
(12) A complaint is either a delivery-related complaint, a shop-related complaint or a comment-related
complaint (non-overlapping and covering).
*/
CREATE CONSTRAINT TRIGGER complaint_type_trigger
AFTER INSERT ON complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION complaint_type_func();


CREATE OR REPLACE FUNCTION complaint_type_func() RETURNS TRIGGER
AS $$
DECLARE
    delivery_count    INTEGER;
    shop_count     INTEGER;
    comment_count     INTEGER;
BEGIN 
    select count(*) into delivery_count from delivery_complaint where id = NEW.id;
    select count(*) into shop_count  from shop_complaint where id = NEW.id;
    select count(*) into comment_count  from comment_complaint where id = NEW.id;

     IF (delivery_count + shop_count + comment_count) = 1
        THEN return NEW;
    ELSE 
        raise exception '% complaint types share the same complaint id of %',
            (delivery_count + shop_count + comment_count), NEW.id;
    END IF;
END;
$$ LANGUAGE plpgsql;

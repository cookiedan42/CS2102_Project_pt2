/*
Complaint related:
(11) A delivery complaint can only be made when the product has been delivered.
*/

CREATE CONSTRAINT TRIGGER complaint_delivered_trigger
AFTER INSERT ON delivery_complaint
DEFERRABLE INITIALLY DEFERRED
FOR EACH ROW EXECUTE FUNCTION complaint_delivered_func();

CREATE OR REPLACE FUNCTION complaint_delivered_func() RETURNS TRIGGER
AS $$
DECLARE
    isDelivered     BOOLEAN;
BEGIN 
    SELECT status = 'delivered' into isDelivered
    FROM Orderline
    WHERE Orderline.order_id = NEW.order_id
        AND Orderline.shop_id = NEW.shop_id
        AND Orderline.product_id = NEW.product_id
        AND Orderline.sell_timestamp = NEW.sell_timestamp
    LIMIT 1;

    IF isDelivered
        THEN return NEW;
    ELSE 
        raise exception 'cannot make complaint when product not delivered';
    END IF;
END;
$$ LANGUAGE plpgsql;
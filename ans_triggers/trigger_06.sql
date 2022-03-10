/*
Refund related:
(6) Refund request can only be made for a delivered product.
*/

CREATE OR REPLACE TRIGGER refund_delivered_trigger
BEFORE INSERT ON refund_request
FOR EACH ROW EXECUTE FUNCTION refund_delivered_func();

CREATE OR REPLACE FUNCTION refund_delivered_func() RETURNS TRIGGER
AS $$
DECLARE 
    isValidStatus BOOLEAN;
BEGIN 
    SELECT orderline.status = 'delivered' INTO isValidStatus
    FROM orderline
    WHERE NEW.order_id = orderline.order_id
        AND NEW.shop_id = orderline.shop_id
        AND NEW.product_id = orderline.product_id
        AND NEW.sell_timestamp = orderline.sell_timestamp
    LIMIT 1;

    IF isValidStatus
        THEN
            return NEW;
    ELSE
        NEW.rejection_reason = 'refund request for undelivered orderline';
        NEW.status = 'rejected';
        NEW.handled_date = CURRENT_DATE;
        NEW.handled_by = 0;
        
        return NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;



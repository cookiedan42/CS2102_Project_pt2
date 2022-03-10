/*
Refund related:
(5) The refund request date must be within 30 days of the delivery date.
*/

CREATE OR REPLACE TRIGGER refund_time_trigger
BEFORE INSERT ON refund_request
FOR EACH ROW EXECUTE FUNCTION refund_time_func();

CREATE OR REPLACE FUNCTION refund_time_func() RETURNS TRIGGER
AS $$
DECLARE 
    isValidDate BOOLEAN;
BEGIN 
    SELECT orderline.delivery_date + 30 >= NEW.request_date INTO isValidDate
    FROM orderline
    WHERE NEW.order_id = orderline.order_id
        AND NEW.shop_id = orderline.shop_id
        AND NEW.product_id = orderline.product_id
        AND NEW.sell_timestamp = orderline.sell_timestamp
    LIMIT 1;

    IF isValidDate
        THEN
            return NEW;
    ELSE
        NEW.rejection_reason = 'refund request made more than 30 days after delivery';
        NEW.status = 'rejected';
        NEW.handled_date = CURRENT_DATE;
        NEW.handled_by = 0;
        
        return NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;


/*
Refund related:
(4) The refund quantity must not exceed the ordered quantity.
*/

CREATE TRIGGER refund_maximum_quantity_trigger
BEFORE INSERT ON refund_request
FOR EACH ROW EXECUTE FUNCTION refund_maximum_quantity_func();

CREATE OR REPLACE FUNCTION refund_maximum_quantity_func() RETURNS TRIGGER
AS $$
DECLARE 
    isValidQuantity BOOLEAN;
    tempQuantity INTEGER;
BEGIN 

    SELECT orderline.quantity INTO tempQuantity
    FROM orderline
    WHERE NEW.order_id = orderline.order_id
        AND NEW.shop_id = orderline.shop_id
        AND NEW.product_id = orderline.product_id
        AND NEW.sell_timestamp = orderline.sell_timestamp
    LIMIT 1;

    SELECT tempQuantity >= NEW.quantity + coalesce(sum(refund_request.quantity), 0) INTO isValidQuantity
    FROM refund_request
    WHERE NEW.order_id = refund_request.order_id
        AND NEW.shop_id = refund_request.shop_id
        AND NEW.product_id = refund_request.product_id
        AND NEW.sell_timestamp = refund_request.sell_timestamp
        AND refund_request.status <> 'rejected';

    IF isValidQuantity
        THEN
            return NEW;
    ELSE
        raise exception 'refund quantity is larger than order quantity';
    END IF;
END;
$$ LANGUAGE plpgsql;

/*
match the refund request to an orderline
*/


/*
CREATE TABLE refund_request (
    id SERIAL PRIMARY KEY,                          -- Enforce key constraint
    handled_by INTEGER REFERENCES employee(id),         -- Enforce key + tp constraint
    order_id INTEGER NOT NULL,
    shop_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    sell_timestamp TIMESTAMP NOT NULL,
    quantity INTEGER,
    request_date DATE,
    status refund_status,
    handled_date DATE,
    rejection_reason TEXT,
    FOREIGN KEY (order_id, shop_id, product_id, sell_timestamp) 
    REFERENCES orderline(order_id, shop_id, product_id, sell_timestamp),
            -- Enforce constraint that refund is accepted/rejected after the request is made
    CHECK (handled_date >= request_date),
        -- Enforce constraint that rejection reason should be null unless refund request is rejected
    CHECK ((status = 'rejected' AND rejection_reason IS NOT NULL) OR (status <> 'rejected' AND rejection_reason IS NULL)),
        -- Enforce constraint that refund handled_date should be null unless refund is handled
    CHECK (((status = 'pending' OR status = 'being_handled') AND handled_date IS NULL) OR ((status = 'accepted' OR status = 'rejected') AND handled_date IS NOT NULL)),
        -- Enforce constraint that refund handled_by should be null if status is pending, and non-null otherwise
    CHECK (((status = 'pending' AND handled_by IS NULL) OR (status <> 'pending' AND handled_by IS NOT NULL)))
);
*/
/*
Refund related:
(4) The refund quantity must not exceed the ordered quantity.
*/

CREATE TRIGGER refund_maximum_quantity_trigger
BEFORE INSERT ON refund_request /*syntax placeholder*/
/* <BEFORE AFTER INSTEAD OF> <INSERT/DELETE/UPDATE> ON <TABLE> */
FOR EACH ROW EXECUTE FUNCTION refund_maximum_quantity_func();

CREATE OR REPLACE FUNCTION refund_maximum_quantity_func() RETURNS TRIGGER
AS $$
DECLARE 
    isValidQuantity BOOLEAN;
BEGIN 

    SELECT orderline.quantity >= NEW.quantity INTO isValidQuantity
    FROM orderline
    WHERE NEW.order_id = orderline.order_id
        AND NEW.shop_id = orderline.shop_id
        AND NEW.product_id = orderline.product_id
        AND NEW.sell_timestamp = orderline.sell_timestamp
    LIMIT 1;

    raise info '%', isValidQuantity;

    IF isValidQuantity
        THEN
            return NEW;
    ELSE
        NEW.rejection_reason = 'refund quantity is larger than order quantity';
        NEW.status = 'rejected';
        -- NEW.handled_date = NEW.request_date;
        NEW.handled_date = CURRENT_DATE;
        NEW.handled_by = 0;
        
        return NEW;
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
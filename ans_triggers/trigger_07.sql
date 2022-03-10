
/*
Comment related:
(7) A user can only make a product review for a product that they themselves purchased.
*/

CREATE CONSTRAINT TRIGGER comment_purchased_trigger
AFTER INSERT ON review
FOR EACH ROW EXECUTE FUNCTION comment_purchased_func();

CREATE OR REPLACE FUNCTION comment_purchased_func() RETURNS TRIGGER
AS $$
DECLARE 
    review_user_id      INTEGER;
    review_order_id     INTEGER;
    buyer_user_id       INTEGER;
    local_exists        BOOLEAN;
BEGIN 
/*
    review must match a orderline
    review must match order for that orderline
*/

    select user_id into review_user_id from comment where id = NEW.id;
    select order_id into review_order_id 
        from orderline 
        where orderline.order_id = NEW.order_id
            and orderline.shop_id = NEW.shop_id
            and orderline.product_id = NEW.product_id
            and orderline.sell_timestamp = NEW.sell_timestamp
        limit 1;

    select user_id into buyer_user_id
        from orders 
        where id = review_order_id
            and user_id = review_user_id
        limit 1;


    IF review_user_id = buyer_user_id
        THEN return NEW;
    ELSE 
        raise exception 'user % cannot make a review for purchase made by user %',
            review_user_id, buyer_user_id ;
    END IF;
END;

$$ LANGUAGE plpgsql;

/*
CREATE TABLE comment (
    id SERIAL PRIMARY KEY,
    -- Enforce Key+TP constraint
    user_id INTEGER REFERENCES users(id) NOT NULL
);

CREATE TABLE review (
    id INTEGER PRIMARY KEY REFERENCES comment(id) ON DELETE CASCADE,
    -- Enforce Key+TP constraint
    order_id INTEGER NOT NULL,
    shop_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    sell_timestamp TIMESTAMP NOT NULL,
    FOREIGN KEY (order_id, shop_id, product_id, sell_timestamp) REFERENCES orderline(order_id, shop_id, product_id, sell_timestamp),
    -- Enforce constraint that a particular product purchase can only be reviewed once
    UNIQUE (order_id, shop_id, product_id, sell_timestamp)
);

*/
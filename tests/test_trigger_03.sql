INSERT into users VALUES
    (1, 'user_address_1', 'user_name_1', FALSE);
INSERT into category values 
    (1, 'category_1',NULL);
INSERT into manufacturer values 
    (1, 'manufacturer_1','country_1');
INSERT into product values 
    (1, 'name', 'desc', 1, 1);
INSERT into shop values 
    (1, '1');
INSERT into sells values 
    (1, 1, '2022-01-01 01:01:01', 1, 1);
INSERT into coupon_batch values
    (1, '2022-01-01', '2022-01-01', 1, 1);
INSERT into issued_coupon values
    (1, 1);


-- cannot insert
INSERT INTO orders values
    (1,1,1,'address',0);
SELECT * from orders;

-- cannot insert
INSERT INTO orders values
    (1,1,1,'address',1);
SELECT * from orders;

-- can insert
INSERT INTO orders values
    (1,1,1,'address',1.1);
SELECT * from orders;
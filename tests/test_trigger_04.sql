INSERT into users VALUES
    (1, 'user_address_1', 'user_name_1', FALSE);
INSERT into category values 
    (1, 'category_1',NULL);
INSERT into employee values
    (0, 'automated',0);
INSERT into manufacturer values 
    (1, 'manufacturer_1','country_1');
INSERT into product values 
    (1, 'name', 'desc', 1, 1);
INSERT into shop values 
    (1, '1');
INSERT into coupon_batch values
    (1, '2022-01-01', '2022-01-01', 1, 1);
INSERT into issued_coupon values
    (1, 1);
INSERT into orders values 
    (1,1,1,'shipping address',1);  

INSERT into sells values 
    (1, 1, '2022-01-01 01:01:01', 1, 1);
INSERT into sells values 
    (1, 1, '2022-01-01 01:01:02', 1, 1);
INSERT into orderline values 
    (1,1,1,'2022-01-01 01:01:01',1,1,'delivered','2022-01-01');
INSERT into orderline values 
    (1,1,1,'2022-01-01 01:01:02',1,1,'delivered','2022-01-01');



-- cannot insert
INSERT INTO refund_request values
    (DEFAULT,NULL,1,1,1,'2022-01-01 01:01:01',2,'2022-01-01','pending',NULL,NULL);
SELECT * from refund_request;

-- cannot insert
INSERT INTO refund_request values
    (DEFAULT,0,1,1,1,'2022-01-01 01:01:02',2,'2022-01-01','rejected','2022-01-01','rejection_reason');
SELECT * from refund_request;

-- can insert
INSERT INTO refund_request values
    (DEFAULT,0,1,1,1,'2022-01-01 01:01:02',1,'2022-01-01','rejected','2022-01-01','rejection_reason');
SELECT * from refund_request;

-- can insert
INSERT INTO refund_request values
    (DEFAULT,NULL,1,1,1,'2022-01-01 01:01:02',1,'2022-01-01','pending',NULL,NULL);
SELECT * from refund_request;

-- cannot insert
INSERT INTO refund_request values
    (DEFAULT,NULL,1,1,1,'2022-01-01 01:01:02',1,'2022-01-01','pending',NULL,NULL);
SELECT * from refund_request;
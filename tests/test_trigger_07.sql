INSERT INTO USERS
VALUES (1, 'user_address_1', 'user_name_1', FALSE),
							(2, 'user_address_2', 'user_name_2', FALSE);


INSERT INTO CATEGORY
VALUES (1, 'category_1', NULL);


INSERT INTO EMPLOYEE
VALUES (0, 'automated', 0);


INSERT INTO MANUFACTURER
VALUES (1, 'manufacturer_1','country_1');


INSERT INTO PRODUCT
VALUES (1, 'name', 'desc', 1, 1);


INSERT INTO SHOP
VALUES (1, '1');


INSERT INTO COUPON_BATCH
VALUES (1, '2022-01-01', '2022-01-01', 1, 1);


INSERT INTO ISSUED_COUPON
VALUES (1, 1);


INSERT INTO ORDERS
VALUES (1, 1, 1,'shipping address', 1);


INSERT INTO SELLS
VALUES (1, 1, '2022-01-01 01:01:01', 1, 1);


INSERT INTO ORDERLINE
VALUES (1, 1, 1, '2022-01-01 01:01:01', 1, 1, 'shipped', '2022-01-01');

-- cannot insert wrong user
BEGIN TRANSACTION;


INSERT INTO COMMENT
VALUES (1, 2);


INSERT INTO REVIEW
VALUES (1, 1, 1, 1, '2022-01-01 01:01:01');


COMMIT;


SELECT *
FROM COMMENT;


SELECT *
FROM REVIEW;

-- can insert correct user

INSERT INTO COMMENT
VALUES (1,1);


INSERT INTO REVIEW
VALUES (1, 1, 1, 1, '2022-01-01 01:01:01');


SELECT *
FROM COMMENT;


SELECT *
FROM REVIEW;
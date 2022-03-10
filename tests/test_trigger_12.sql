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
    (1, 1, '2022-01-01 01:01:01', 1, 1),
    (1, 1, '2022-01-01 01:01:02', 1, 1),
    (1, 1, '2022-01-01 01:01:03', 1, 1),
    (1, 1, '2022-01-01 01:01:04', 1, 1),
    (1, 1, '2022-01-01 01:01:05', 1, 1);

INSERT into orderline values 
    (1,1,1,'2022-01-01 01:01:01',1,1,'shipped','2022-01-01'),
    (1,1,1,'2022-01-01 01:01:02',1,1,'shipped','2022-01-01'),
    (1,1,1,'2022-01-01 01:01:03',1,1,'shipped','2022-01-01'),
    (1,1,1,'2022-01-01 01:01:04',1,1,'shipped','2022-01-01'),
    (1,1,1,'2022-01-01 01:01:05',1,1,'shipped','2022-01-01');


INSERT into COMMENT VALUES
    (1,1);

-- cannot insert none
INSERT into complaint values
    (1, 'text', 'pending', 1, NULL);

select * from complaint;
-- cannot insert 3
BEGIN TRANSACTION;
INSERT into complaint values
    (2, 'text', 'pending', 1, NULL);
INSERT into shop_complaint values
    (2, 1);
INSERT into comment_complaint values 
    (2, 1);
INSERT into delivery_complaint values 
    (2,1,1,1,'2022-01-01 01:01:02');
COMMIT;
SELECT * FROM complaint;
SELECT * FROM shop_complaint;
SELECT * FROM comment_complaint;
SELECT * FROM delivery_complaint;

-- can insert 1
BEGIN TRANSACTION;
INSERT into complaint values
    (3, 'text', 'pending', 1, NULL),
    (4, 'text', 'pending', 1, NULL),
    (5, 'text', 'pending', 1, NULL);
INSERT into shop_complaint values
    (3, 1);
INSERT into comment_complaint values 
    (4, 1);
INSERT into delivery_complaint values 
    (5,1,1,1,'2022-01-01 01:01:05');
COMMIT;
SELECT * FROM complaint;
SELECT * FROM shop_complaint;
SELECT * FROM comment_complaint;
SELECT * FROM delivery_complaint;

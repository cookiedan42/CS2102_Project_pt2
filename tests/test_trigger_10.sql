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
    (1, 1, '2022-01-01 01:01:04', 1, 1);

INSERT into orderline values 
    (1,1,1,'2022-01-01 01:01:01',1,1,'shipped','2022-01-01'),
    (1,1,1,'2022-01-01 01:01:02',1,1,'shipped','2022-01-01'),
    (1,1,1,'2022-01-01 01:01:03',1,1,'shipped','2022-01-01'),
    (1,1,1,'2022-01-01 01:01:04',1,1,'shipped','2022-01-01');

-- cannot insert no version
BEGIN TRANSACTION;
INSERT into comment values
    (1,1);
INSERT into review values
    (1,1,1,1,'2022-01-01 01:01:01');
COMMIT;
select * from comment;
select * from review;


-- can insert 1 version
BEGIN TRANSACTION;
INSERT into comment values
    (2,1);
INSERT into review values
    (2,1,1,1,'2022-01-01 01:01:02');
INSERT into review_version values
    (2,'2022-01-01 01:01:02','text',1);
COMMIT;

select * from comment;
select * from review;

-- can insert 2 version
BEGIN TRANSACTION;
INSERT into comment values
    (3,1);
INSERT into review values
    (3,1,1,1,'2022-01-01 01:01:03');
INSERT into review_version values
    (3,'2022-01-01 01:01:03','text',1),
    (3,'2022-01-01 01:01:04','text',1);

    
COMMIT;

select * from comment;
select * from review;
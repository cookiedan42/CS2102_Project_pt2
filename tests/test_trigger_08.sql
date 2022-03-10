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



-- cannot insert neither
INSERT into comment values
    (1,1);

select * from comment;
select * from review;
select * from reply;


-- cannot insert both
BEGIN TRANSACTION;
INSERT into comment values
    (2,1);
INSERT INTO review values
    (2, 1, 1, 1, '2022-01-01 01:01:02');
INSERT into reply values 
    (2,2);
COMMIT;

select * from comment;
select * from review;
select * from reply;


-- can insert review
BEGIN TRANSACTION;
INSERT into comment values
    (3,1);
INSERT INTO review values
    (3, 1, 1, 1, '2022-01-01 01:01:03');
COMMIT;

select * from comment;
select * from review;
select * from reply;


-- can insert reply
BEGIN TRANSACTION;
INSERT into comment values
    (4,1);
INSERT INTO reply values
    (4,3);
COMMIT;

select * from comment;
select * from review;
select * from reply;

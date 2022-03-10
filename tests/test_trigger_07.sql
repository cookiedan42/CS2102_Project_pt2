INSERT into users VALUES
    (1, 'user_address_1', 'user_name_1', FALSE),
    (2, 'user_address_2', 'user_name_2', FALSE);
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
INSERT into orderline values 
    (1,1,1,'2022-01-01 01:01:01',1,1,'shipped','2022-01-01'),

-- cannot insert wrong user
Begin TRANSACTION;
INSERT into comment values
    (1,2);
INSERT INTO review values
    (1, 1, 1, 1, '2022-01-01 01:01:01');
commit;
select * from comment;
select * from review;


-- can insert correct user
INSERT into comment values
    (1,1);
INSERT INTO review values
    (1, 1, 1, 1, '2022-01-01 01:01:01');
select * from comment;
select * from review;

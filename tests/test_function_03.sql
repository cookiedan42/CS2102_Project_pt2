insert into users VALUES
	(1,'address_1','userName_1', false),
	(2,'address_2','userName_2', false)
;
insert into shop VALUES
	(1,'shop_1'),
	(2,'shop_2'),
	(3,'shop_3'),
	(4,'shop_4'),
	(5,'shop_5')
;

INSERT into category VALUES
    -- category is not relevant, make it one
    (1,'category_1',NULL)
;

insert into manufacturer VALUES
	(1,'manu_1')
;
insert into product VALUES
	(11, 'product_1_1', 'product_1_1', 1, 1),
	(199, 'product_1_99', 'product_1_99_unsold', 1, 1)
;
insert into sells VALUES
	-- timestamp is 01:shop:product
	(1, 11, '2022-01-01 01:01:11',1,1),
	(2, 11, '2022-01-01 01:02:11',1,1),
	(3, 11, '2022-01-01 01:03:11',1,1),
	(4, 11, '2022-01-01 01:04:11',1,1),
	(5, 11, '2022-01-01 01:05:11',1,1)
;

-- ignore coupons

insert into orders VALUES
	-- id is user_orderNo
	(11, 1, NULL, 'shopping', 1),
	(21, 2, NULL, 'shopping', 1)
;
insert into orderline VALUES
	-- orderline primary key is sells X order
	(11, 1, 11, '2022-01-01 01:01:11', 1, 1, 'delivered','2022-12-31'),
	(11, 2, 11, '2022-01-01 01:02:11', 1, 1, 'delivered','2022-12-31'),
	(11, 3, 11, '2022-01-01 01:03:11', 1, 1, 'delivered','2022-12-31'),
	(11, 4, 11, '2022-01-01 01:04:11', 1, 1, 'delivered','2022-12-31'),
	(11, 5, 11, '2022-01-01 01:05:11', 1, 1, 'delivered','2022-12-31'),
	(21, 1, 11, '2022-01-01 01:01:11', 1, 1, 'delivered','2022-12-31'),
	(21, 2, 11, '2022-01-01 01:02:11', 1, 1, 'delivered','2022-12-31'),
	(21, 3, 11, '2022-01-01 01:03:11', 1, 1, 'delivered','2022-12-31'),
	(21, 4, 11, '2022-01-01 01:04:11', 1, 1, 'delivered','2022-12-31'),
	(21, 5, 11, '2022-01-01 01:05:11', 1, 1, 'delivered','2022-12-31')
;

-- ignore comments


insert into employee values
    -- only 1 employee
    (1,'only',1)
;

insert into refund_request VALUES
	(11111, NULL, 11, 1,11, '2022-01-01 01:01:11', 1, '2022-12-30', 'pending', NUll,NULL),
	(21111, NULL, 21, 1,11, '2022-01-01 01:01:11', 1, '2022-12-30', 'pending', NUll,NULL)
;
insert into complaint values
    (1  , '', 'pending', 1, NULL),
    (101, '', 'pending', 1, NULL),
    (102, '', 'pending', 1, NULL)
;
insert into shop_complaint values
    (1,2)
;
insert into delivery_complaint values
    -- same orderline different complaint
    (101, 11, 3, 11,'2022-01-01 01:03:11'),
    (102, 11, 3, 11,'2022-01-01 01:03:11')
;
insert into comment values
    (1,1),
    (2, 1)
;
insert into review values
    -- uid, orderline
    (1, 11, 4, 11,'2022-01-01 01:04:11'),
    (2, 11, 5, 11,'2022-01-01 01:05:11')
;
insert into review_version values
    -- same orderline different complaint
    (1, '2022-01-01 01:04:11', '2022-01-01 01:04:11', 1),
    (1, '2022-01-01 01:04:21', '2022-01-01 01:04:11', 2),
    (2, '2022-01-01 01:05:11', '2022-01-01 01:05:11', 2),
    (2, '2022-01-01 01:05:21', '2022-01-01 01:05:11', 1)
;

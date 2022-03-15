insert into users VALUES
	(1,'address_1','userName_1', false)
;
insert into shop VALUES
	(1,'shop_1')
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
	(12, 'product_1_2', 'product_1_2', 1, 1)
;
insert into sells VALUES
	-- timestamp is 01:shop:product
	(1, 11, '2022-01-01 01:01:11',11,100),
	(1, 12, '2022-01-01 01:01:12',12,100)
;
insert into orders VALUES
	-- id is user_orderNo
	(11, 1, NULL, 'shopping', 1)
;
insert into orderline VALUES
	-- orderline primary key is sells X order
	(11, 1, 11, '2022-01-01 01:01:11', 1, 1, 'delivered','2022-12-31'),
	(11, 1, 12, '2022-01-01 01:01:12', 1, 1, 'delivered','2022-12-31')
;
insert into comment values

    (1, 1)

;
insert into review values

    (1, 11, 1, 11, '2022-01-01 01:01:11')

;

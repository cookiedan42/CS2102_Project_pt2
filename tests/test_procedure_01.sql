insert into users VALUES
	(1,'address_1','userName_1', false),
	(2,'address_2','userName_2', false)
;
insert into shop VALUES
	(1,'shop_1'),
	(2,'shop_2')
;

INSERT into category VALUES
    -- category is not relevant, make it one
    (1,'category_1',NULL)
;

insert into manufacturer VALUES
	(1,'manu_1'),
	(2,'manu_2')
;
insert into product VALUES
	(11, 'product_1_1', 'product_1_1', 1, 1),
	(12, 'product_1_2', 'product_1_2', 1, 1),
	(21, 'product_2_1', 'product_2_1', 1, 2),
	(22, 'product_2_2', 'product_2_2', 1, 2)
;
insert into sells VALUES
	-- timestamp is 01:shop:product
	(1, 11, '2022-01-01 01:01:11',11,100),
	(1, 12, '2022-01-01 01:01:12',12,100),
	(1, 21, '2022-01-01 01:01:21',21,100),
	(1, 22, '2022-01-01 01:01:22',22,100),
	(2, 11, '2022-01-01 01:02:11',11,100),
	(2, 12, '2022-01-01 01:02:12',12,100),
	(2, 21, '2022-01-01 01:02:21',21,100),
	(2, 22, '2022-01-01 01:02:22',22,100)
;
insert into coupon_batch VALUES
	(1, '2022-01-01', '2022-01-01', 1.1, 10),
	(2, '2022-01-01', '2022-01-01', 1, 10)
;
insert into issued_coupon VALUES
	(1, 1),
	(2, 1),
	(1, 2),
	(2, 2)
;


call place_order(1, NULL, TEXT 'shipping_address_01', ARRAY [1, 2], ARRAY [11, 22], 
ARRAY [TIMESTAMP '2022-01-01 01:01:11', '2022-01-01 01:02:22'], ARRAY [1, 1], ARRAY [10.00, 20.00]);

call place_order(1, 1, TEXT 'shipping_address_01', ARRAY [1, 2], ARRAY [11, 22], 
ARRAY [TIMESTAMP '2022-01-01 01:01:11', '2022-01-01 01:02:22'], ARRAY [1, 1], ARRAY [10.00, 20.00]);

call place_order(2, NULL, TEXT 'shipping_address_02', ARRAY [1, 1, 1, 1], ARRAY [11, 12, 21, 22], 
ARRAY [TIMESTAMP '2022-01-01 01:01:11', '2022-01-01 01:01:12', '2022-01-01 01:01:21', '2022-01-01 01:01:22'], ARRAY [1, 1, 1, 1], ARRAY [10.00, 10.00, 10.00, 10.00]);

call place_order(2, 2, TEXT 'shipping_address_02', ARRAY [1, 1, 1, 1], ARRAY [11, 12, 21, 22], 
ARRAY [TIMESTAMP '2022-01-01 01:01:11', '2022-01-01 01:01:12', '2022-01-01 01:01:21', '2022-01-01 01:01:22'], ARRAY [1, 1, 1, 1], ARRAY [10.00, 10.00, 10.00, 10.00]);

call place_order(2, NULL, TEXT 'shipping_address_02', ARRAY [1, 2, 1, 2], ARRAY [11, 22, 22, 11], 
ARRAY [TIMESTAMP '2022-01-01 01:01:11', '2022-01-01 01:02:22', '2022-01-01 01:01:22', '2022-01-01 01:02:11'], ARRAY [1, 2, 2, 1], ARRAY [10.00, 20.00, 20.00, 10.00]);

select * from sells;
select * from orders;
select * from orderline;
INSERT into users VALUES
-- id, address, name, account_closed
    (1, 'address_1', 'user_name_1', false),
    (2, 'address_2', 'this should be deleted user', true);

INSERT into shop values 
-- id, name
    (1, 'shop_1'),
    (2, 'shop_2');

insert into category values 
    -- id, name, parent
    (1, 'category_1', null);

insert into manufacturer values 
    -- id, name, country
    (1, 'manufacturer_1', 'country_1');

insert into product values
-- id, name, description, categoryID, manufacturerID
    (1,'product_1','product_1',1,1),
    (2,'product_2','product_2',1,1);

insert into sells values
-- shopID, productID, sell_timestamp, price, quantity
    -- timestamp seconds is shopID,productID
    (1, 1, '2022-01-01 01:01:11', 1, 10),
    (1, 2, '2022-01-01 01:01:12', 1, 10 ),
    (2, 1, '2022-01-01 01:01:21', 1, 10 ),
    (2, 2, '2022-01-01 01:01:22', 1, 10 );

insert into orders values 
-- id, userID, couponID, shipping_address, paymentAmt
    (11,1,null,'shopping_address', 1),
    (12,1,null,'shopping_address', 1),

    (21,2,null,'shopping_address', 1),
    (22,2,null,'shopping_address', 1);

insert into orderline values 
-- (orderID, shopID, productID, sell_timestamp), quantity, shippingCost, status, deliveryDate
    (11, 1, 1, '2022-01-01 01:01:11',        1, 1, 'delivered', '2022-01-01' ),
    (11, 1, 2, '2022-01-01 01:01:12',        1, 1, 'delivered', '2022-01-01' ),
    (11, 2, 1, '2022-01-01 01:01:21',        1, 1, 'delivered', '2022-01-01' ),
    (11, 2, 2, '2022-01-01 01:01:22',        1, 1, 'delivered', '2022-01-01' ),

    (21, 1, 1, '2022-01-01 01:01:11',        1, 1, 'delivered', '2022-01-01' ),
    (21, 1, 2, '2022-01-01 01:01:12',        1, 1, 'delivered', '2022-01-01' ),
    (22, 1, 1, '2022-01-01 01:01:11',        1, 1, 'delivered', '2022-01-01' ),
    (22, 1, 2, '2022-01-01 01:01:12',        1, 1, 'delivered', '2022-01-01' );

INSERT INTO comment values 
-- id, user
    -- id is orderID_2, shopID_1, productID_1 for reviews
    (1111,1), (1112,1), (1121,1), (1122,1),
    (2111,2), (2112,2), (2211,2), (2212,2),
    -- id is parent, id for replies
    (11115,1), (11125,1), (11210,1), (1122000,1),
    (11116,2), (11126,2), (221100,2), (221200000,2);

INSERT INTO review VALUES
-- id, orderline fk
-- id, (orderID, shopID, productID, sell_timestamp)
    (1111, 11, 1, 1,'2022-01-01 01:01:11'),
    (1112, 11, 1, 2,'2022-01-01 01:01:12'),
    (1121, 11, 2, 1,'2022-01-01 01:01:21'),
    (1122, 11, 2, 2,'2022-01-01 01:01:22'),
    (2111, 21, 1, 1,'2022-01-01 01:01:11'),
    (2112, 21, 1, 2,'2022-01-01 01:01:12'),
    (2211, 22, 1, 1,'2022-01-01 01:01:11'),
    (2212, 22, 1, 2,'2022-01-01 01:01:12');

Insert into review_version values
-- reviewID, reviewTimeStamp,       content, rating
    (1111, '2022-01-01 01:01:01', 'review_1_time1', 1),
    (1111, '2022-01-01 01:01:02', 'review_1_time1', 2),
    (2111, '2022-01-01 01:01:03', 'review_2_time1', 3),
    (2211, '2022-01-01 01:01:04', 'review_2_time1', 4);

Insert into reply values
-- id, parent
(11115,1111), (11125,1112),
(11116,1111), (11126,1112);

insert into reply_version values 
-- replyID, timestamp,      content
    (11115, '2022-01-01 01:01:11', 'reply_1111_01_v1'),
    (11116, '2022-01-01 01:01:12', 'reply_1111_02_v1'),
    (11116, '2022-01-01 01:01:13', 'reply_1111_02_v2'),
    (11126, '2022-01-01 01:01:14', 'reply_1112_02');






select * from view_comments(1,1,'2022-01-01 01:01:11');
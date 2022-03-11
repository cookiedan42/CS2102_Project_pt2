INSERT into users VALUES
    (1, 'address_1', 'user_name_1', false),
    (2, 'address_2', 'this should be deleted user', true);
INSErt into shop values 
    (1, 'shop_1'),
    (2, 'shop_2');
insert into category values 
    (1, 'category_1', null);
insert into manufacturer values 
    (1, 'manufacturer_1', 'country_1');

insert into product values 
    (1,'product_1','product_1',1,1),
    (2,'product_2','product_2',1,1);
insert into sells values
    (1, 1, '2022-01-01 01:01:11', 1, 10),
    (1, 2, '2022-01-01 01:01:12', 1, 10 ),
    (2, 1, '2022-01-01 01:01:21', 1, 10 ),
    (2, 2, '2022-01-01 01:01:22', 1, 10 );
insert into orders values 
    (1,1,null,'shopping_address', 1),
    (2,2,null,'shopping_address', 1);
insert into orderline values 
    (1, 1, 1, '2022-01-01 01:01:11', 1, 1, 'delivered', '2022-01-01' ),
    (1, 1, 2, '2022-01-01 01:01:12', 1, 1, 'delivered', '2022-01-01' ),
    (2, 1, 1, '2022-01-01 01:01:11', 1, 1, 'delivered', '2022-01-01' ),
    (2, 1, 2, '2022-01-01 01:01:12', 1, 1, 'delivered', '2022-01-01' );
INSERT INTO comment values 
    (3,1),
    (2,1),
    (1,2),
    (4,2),

    (5,1),
    (6,1),
    (7,2),
    (8,2);

    
INSERT INTO review VALUES
    (1, 1, 1,1,'2022-01-01 01:01:11'),
    (2, 1, 1,2,'2022-01-01 01:01:12'),
    (3, 2, 1,1,'2022-01-01 01:01:11'),
    (4, 2, 1,2,'2022-01-01 01:01:12');

Insert into review_version values 
    (1, '2022-01-01 01:01:01', 'review_1_time1', 1),
    (1, '2022-01-01 01:01:02', 'review_1_time1', 2),
    (2, '2022-01-01 01:01:03', 'review_2_time1', 3),
    (2, '2022-01-01 01:01:04', 'review_2_time1', 4);

Insert into reply values
    (5,1),
    (6,2),
    (7,3),
    (8,4);

insert into reply_version values 
    (5, '2022-01-01 01:01:11', 'reply_5_01'),
    (5, '2022-01-01 01:01:12', 'reply_5_02'),
    (6, '2022-01-01 01:01:13', 'reply_6_01'),
    (6, '2022-01-01 01:01:14', 'reply_6_02');






select * from view_comments(1,1,'2022-01-01 01:01:11');



select * 
    from comment
    join users on comment.user_id = users.id

    full outer join review          on comment.id = review.id
    full outer join review_version  on review.id = review_version.review_id

    full outer join reply           on comment.id = reply.id
    full outer join reply_version   on reply.id = reply_version.reply_id

    
    order by comment.id
    
;
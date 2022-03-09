INSERT into category values 
    (1,'category_1',NULL);
INSERT into manufacturer values 
    (1,'manufacturer_1','country_1');
INSERT into product values 
    (1, 'name', 'desc', 1, 1);


-- cannot insert
INSERT into shop values 
    (1,'1');
SELECT * from shop;

-- can insert
BEGIN TRANSACTION;
INSERT into shop values 
    (1,'1');
INSERT into sells values 
    (1, 1, '2022-01-01 01:01:01', 1, 1);
COMMIT;
SELECT * from shop;
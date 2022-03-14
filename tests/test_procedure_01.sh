#!/usr/bin/env bash
# psql < ./debug.in
BASE="
\set QUIET on
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_procedures/procedure_01.sql
\i ./test_procedure_01.sql
;"

test1="
-- not placed, over quantity
call place_order(
    1,
    NULL,
    'shipping',
    '{1, 1}',
    '{11, 12}',
    '{2022-01-01 01:01:11, 2022-01-01 01:01:12}',
    '{20, 200}',
    '{4, 4}'
)
;
select * from sells;
select * from orders;
select * from orderline;
"

works="
-- works
call place_order(
    1,
    NULL,
    'shipping',
    '{1, 1}',
    '{11, 12}',
    '{2022-01-01 01:01:11, 2022-01-01 01:01:12}',
    '{20, 20}',
    '{4, 4}'
)
;
select * from sells;
select * from orders;
select * from orderline;
"

coupon="
-- same as works, but with a coupon applied
call place_order(
    1,
    1,
    'shipping',
    '{2, 2}',
    '{11, 12}',
    '{2022-01-01 01:02:11, 2022-01-01 01:02:12}',
    '{20, 20}',
    '{4, 4}'
)
;
select * from sells;
select * from orders;
select * from orderline;
"

printf "$BASE$test1" | psql

printf "$BASE$works$coupon" | psql




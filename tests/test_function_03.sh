#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_functions/function_03.sql
\i ./test_function_03.sql
;
select * from get_worst_shops(10)
;
select * from get_worst_shops(0)
;
select * from get_worst_shops(5)
;
"

printf "$BASE" | psql
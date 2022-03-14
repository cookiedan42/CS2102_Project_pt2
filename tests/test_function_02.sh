#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_functions/function_02.sql
\i ./test_function_02.sql
;
SELECT * from 
get_most_returned_products_from_manufacturer( 2,5)
;
"

printf "$BASE" | psql
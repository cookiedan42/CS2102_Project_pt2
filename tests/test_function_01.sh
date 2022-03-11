#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_functions/function_01.sql
\i ./test_function_01.sql
"

printf "$BASE" | psql
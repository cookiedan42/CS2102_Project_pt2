#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_procedures/procedure_03.sql
\i ./test_procedure_03.sql
;
call reply(1, 1, 'hello', '2022-01-01 01:01:12' );
call reply(1, 1, 'hello2', '2022-01-01 01:01:13' );

Select * from reply;
Select * from reply_version;
"

printf "$BASE" | psql
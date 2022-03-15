#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_procedures/procedure_02.sql
\i ./test_procedure_02.sql
;
select * from comment;
select * from review_version;

"

_1_1_exists="
call review(
1, 11, 1, 11,
'2022-01-01 01:01:11','',
1,'2022-01-01 01:01:11'
);
select * from comment;
select * from review_version;

"

_1_2_new="
call review(
1, 11, 1, 12,
'2022-01-01 01:01:12','',
1,'2022-01-01 01:01:12'
);
select * from comment;
select * from review_version;
"

printf "$BASE""$_1_1_exists""$_1_2_new" | psql
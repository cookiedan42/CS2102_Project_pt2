#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_triggers/trigger_03.sql
\i ./test_trigger_03.sql
"

printf "$BASE" | psql
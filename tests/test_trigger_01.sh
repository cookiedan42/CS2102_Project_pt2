#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_triggers/trigger_01.sql
\i ./test_trigger_01.sql
"

printf "$BASE" | psql
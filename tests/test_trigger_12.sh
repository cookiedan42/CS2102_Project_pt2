#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_triggers/trigger_12.sql
\i ./test_trigger_12.sql
"

printf "$BASE" | psql
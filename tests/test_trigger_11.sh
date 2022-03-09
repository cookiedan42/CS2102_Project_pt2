#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_triggers/trigger_11.sql
\i ./test_trigger_11.sql
"

printf "$BASE" | psql
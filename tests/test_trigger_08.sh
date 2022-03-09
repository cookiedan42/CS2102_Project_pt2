#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i ../reset.sql
\i ../schema.sql
\i ../ans_triggers/trigger_08.sql
\i ./test_trigger_08.sql
"

printf "$BASE" | psql
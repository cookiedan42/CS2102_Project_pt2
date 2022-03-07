#!/usr/bin/env bash
# psql < ./debug.in
BASE="
create database project
\c project
\i schema.sql
\i triggers.sql
\i functions.sql
\i procedures.sql
"

printf "$BASE" | psql

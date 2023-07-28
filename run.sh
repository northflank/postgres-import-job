#!/usr/bin/env ash

set -e

echo "${HOST}:${PORT}:${USER}:${PASSWORD}" > ~/.pgpass

pg_dumpall ${DUMP_FLAGS} | psql "${DST_POSTGRES}"
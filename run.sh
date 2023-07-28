#!/usr/bin/env ash

set -e

echo "${HOST}:${PORT}:${DATABASE}:${USER}:${PASSWORD}" > ~/.pgpass

pg_dumpall ${DUMP_FLAGS} | psql "${DST_POSTGRES}"
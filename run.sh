#!/usr/bin/env ash

set -e

echo "${HOST}:${PORT}:${DATABASE}:${USER}:${PASSWORD}" > ~/.pgpass

chmod 0600 ~/.pgpass

pg_dumpall ${DUMP_FLAGS} | psql "${DST_POSTGRES}"
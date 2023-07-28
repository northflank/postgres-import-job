#!/usr/bin/env ash

set -e

echo "${PASSWORD}" > ~/.pgpass

pg_dumpall ${DUMP_FLAGS} "${SRC_POSTGRES}" | psql "${DST_POSTGRES}"
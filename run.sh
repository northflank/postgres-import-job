#!/usr/bin/env ash

set -e

pg_dump ${DUMP_FLAGS} "${SRC_POSTGRES}" | psql "${DST_POSTGRES}"

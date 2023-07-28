#!/usr/bin/env ash

set -e

PGPASS="/run/postgresql/.pgpass"

echo "${HOST}:${PORT}:${DATABASE}:${USER}:${PASSWORD}" > $PGPASS

chmod 0600 $PGPASS

pg_dumpall ${DUMP_FLAGS} | psql "${DST_POSTGRES}"
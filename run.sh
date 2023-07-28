#!/usr/bin/env ash

set -e

PGPASS_FOLDER=`dirname ${PGPASSFILE}`

mkdir -p ${PGPASS_FOLDER}

echo "${HOST}:${PORT}:${DATABASE}:${USER}:${PASSWORD}" > $PGPASSFILE

chmod 0600 $PGPASSFILE

ls -al ${PGPASS_FOLDER}

cat $PGPASSFILE

pg_dumpall ${DUMP_FLAGS} | psql "${DST_POSTGRES}"
#!/usr/bin/env ash

set -e

pg_dump -Fc ${DUMP_FLAGS} "${SRC_POSTGRES}" > ${BASE_PATH}/dump
pg_restore ${RESTORE_FLAGS} "${DST_POSTGRES}" ${BASE_PATH}/dump

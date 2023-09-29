#!/usr/bin/env ash

set -e
echo "===== $(date)"
pg_dump -F${DUMP_FORMAT:-c} ${DUMP_FLAGS} "${SRC_POSTGRES}" > ${BASE_PATH}/dump
echo "===== $(date)"
pg_restore ${RESTORE_FLAGS} "${DST_POSTGRES}" ${BASE_PATH}/dump
echo "===== $(date)"

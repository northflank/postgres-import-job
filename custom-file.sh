#!/usr/bin/env ash

set -e
if [ ! -f ${BASE_PATH}/dump ] || [ "${FORCE_DUMP}" == "true" ]; then
  echo "===== $(date)"
  pg_dump -F${DUMP_FORMAT:-c} ${DUMP_FLAGS} "${SRC_POSTGRES}" > ${BASE_PATH}/dump
fi
echo "===== $(date)"
pg_restore ${RESTORE_FLAGS} "${DST_POSTGRES}" ${BASE_PATH}/dump
echo "===== $(date)"

#!/usr/bin/env ash
set +e

if [ ! -f ${BASE_PATH}/dump ] || [ "${FORCE_DUMP}" == "true" ]; then
  echo "===== $(date)"
  pg_dump -F${DUMP_FORMAT:-c} ${DUMP_FLAGS} "${SRC_POSTGRES}" > ${BASE_PATH}/dump
fi
echo "===== $(date)"
pg_restore -l -Fd ${BASE_PATH}/dump | sed '/MATERIALIZED VIEW DATA/d' > ordered.lst
pg_restore -L ordered.lst ${RESTORE_FLAGS} -d "${DST_POSTGRES}" ${BASE_PATH}/dump
if [ "${DO_REFRESH}" == "true" ]; then
  pg_restore -l -Fd ${BASE_PATH}/dump | grep 'MATERIALIZED VIEW DATA' > refresh.lst
  pg_restore -L refresh.lst ${RESTORE_FLAGS} -d "${DST_POSTGRES}" ${BASE_PATH}/dump
fi
echo "===== $(date)"

echo "DONE"
if [ "$SLEEP" != "" ]; then
  echo "sleeping"
  sleep 500000
fi

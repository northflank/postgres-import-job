#!/usr/bin/env ash

set -e

pg_dump -F${DUMP_FORMAT:-c} ${DUMP_FLAGS} "${SRC_POSTGRES}" | pg_restore ${RESTORE_FLAGS} "${DST_POSTGRES}"

#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="/Users/ccy/Desktop/毕业设计/毕业设计项目资料代码/CCY_EMR_SERVICE"
BACKUP_DIR="${PROJECT_DIR}/backup/postgres"
CONTAINER_NAME="emr-postgres"
DB_NAME="emr_db"
DB_USER="emr_user"
KEEP_DAYS=14

mkdir -p "${BACKUP_DIR}"

timestamp="$(date +%Y%m%d_%H%M%S)"
outfile="${BACKUP_DIR}/${DB_NAME}_${timestamp}.dump"

docker exec "${CONTAINER_NAME}" pg_dump -U "${DB_USER}" -d "${DB_NAME}" -Fc > "${outfile}"

find "${BACKUP_DIR}" -type f -name "${DB_NAME}_*.dump" -mtime +"${KEEP_DAYS}" -delete

echo "backup_ok ${outfile}"

#!/bin/bash
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="./backups"
CONTAINER_NAME="lietsi-postgis"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create backup
docker exec $CONTAINER_NAME pg_dump -U postgres lietsi > "$BACKUP_DIR/lietsi_$TIMESTAMP.sql"

# Compress backup
gzip "$BACKUP_DIR/lietsi_$TIMESTAMP.sql"

# Delete backups older than 30 days
find "$BACKUP_DIR" -name "lietsi_*.sql.gz" -mtime +30 -delete

echo "Backup completed: lietsi_$TIMESTAMP.sql.gz"

#!/bin/bash

# Source folder (can be passed as argument: ./backup.sh /path)
SOURCE="${1:-$HOME/Documents}"

# Destination folder
DEST="$HOME/backups"

# Log file
LOG="$DEST/backup.log"

# Archive name with timestamp
DATE=$(date +%Y-%m-%d_%H-%M)
FILENAME="backup_$DATE.tar.gz"

# Create destination folder if not exists
mkdir -p "$DEST"

# Create archive
tar -czf "$DEST/$FILENAME" "$SOURCE" 2>/dev/null

# Write to log
echo "[$DATE] Backup: $SOURCE -> $DEST/$FILENAME" >> "$LOG"
echo "✅ Backup saved: $DEST/$FILENAME"

# Delete backups older than 7 days
find "$DEST" -name "*.tar.gz" -mtime +7 -delete
echo "🧹 Old backups cleaned up"

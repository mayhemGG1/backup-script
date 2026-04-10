#!/bin/bash

# Що бекапимо (можна передати як аргумент: ./backup.sh /шлях)
SOURCE="${1:-$HOME/Documents}"

# Куди зберігаємо
DEST="$HOME/backups"

# Лог файл
LOG="$DEST/backup.log"

# Назва архіву з датою
DATE=$(date +%Y-%m-%d_%H-%M)
FILENAME="backup_$DATE.tar.gz"

# Створюємо папку якщо нема
mkdir -p "$DEST"

# Робимо архів
tar -czf "$DEST/$FILENAME" "$SOURCE" 2>/dev/null

# Записуємо в лог
echo "[$DATE] Бекап: $SOURCE -> $DEST/$FILENAME" >> "$LOG"
echo "✅ Бекап збережено: $DEST/$FILENAME"

# Видаляємо бекапи старше 7 днів
find "$DEST" -name "*.tar.gz" -mtime +7 -delete
echo "🧹 Старі бекапи очищено"

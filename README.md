# Backup Script

A bash script for automatic file backup with rotation and logging.

## Features
- Creates .tar.gz archive with timestamp in filename
- Keeps a log of all backups
- Automatically deletes backups older than 7 days
- Supports custom source folder as argument

## Usage
Run default backup of Documents folder:
./backup.sh

Run backup of any folder:
./backup.sh /path/to/folder

## Requirements
- Linux / macOS
- bash, tar, find

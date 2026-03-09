#!/bin/bash

# Configuration
STORAGE_ACCOUNT="mystorage1773062446"
CONTAINER_NAME="user-files"
LOG_FILE="storage_activity.log"

# Function to log actions (Bonus Task)
log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 {upload|download|list|delete} [filename]"
    exit 1
fi

ACTION=$1
FILENAME=$2

case $ACTION in
    upload)
        if [ -z "$FILENAME" ]; then echo "Specify a file to upload"; exit 1; fi
        echo "Uploading $FILENAME..."
        az storage blob upload --account-name "$STORAGE_ACCOUNT" --container-name "$CONTAINER_NAME" --file "$FILENAME" --name "$FILENAME" --auth-mode key
        log_action "UPLOADED: $FILENAME"
        ;;
    download)
        if [ -z "$FILENAME" ]; then echo "Specify a file to download"; exit 1; fi
        echo "Downloading $FILENAME..."
        az storage blob download --account-name "$STORAGE_ACCOUNT" --container-name "$CONTAINER_NAME" --name "$FILENAME" --file "./downloaded_$FILENAME" --auth-mode key
        log_action "DOWNLOADED: $FILENAME"
        ;;
    list)
        echo "Listing files in $CONTAINER_NAME..."
        az storage blob list --account-name "$STORAGE_ACCOUNT" --container-name "$CONTAINER_NAME" --output table --auth-mode key
        log_action "LISTED ALL FILES"
        ;;
    delete)
        if [ -z "$FILENAME" ]; then echo "Specify a file to delete"; exit 1; fi
        echo "Deleting $FILENAME..."
        az storage blob delete --account-name "$STORAGE_ACCOUNT" --container-name "$CONTAINER_NAME" --name "$FILENAME" --auth-mode key
        log_action "DELETED: $FILENAME"
        ;;
    *)
        echo "Invalid action. Use: upload, download, list, or delete."
        ;;
esac
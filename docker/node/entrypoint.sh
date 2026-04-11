#!/bin/bash
set -e

VERSION_FILE="/root/.bch2/.node_version"
CURRENT_VERSION="27.0.2"

# Check if we need to reindex (version changed or first run after 27.0.2)
if [ -f "$VERSION_FILE" ]; then
    STORED_VERSION=$(cat "$VERSION_FILE")
    if [ "$STORED_VERSION" != "$CURRENT_VERSION" ]; then
        echo "Node upgraded from $STORED_VERSION to $CURRENT_VERSION - reindexing required"
        REINDEX="-reindex"
    fi
else
    # First run with version tracking, check if data exists
    if [ -d "/root/.bch2/blocks" ]; then
        echo "First run with v$CURRENT_VERSION on existing data - reindexing required"
        REINDEX="-reindex"
    fi
fi

# Store current version
echo "$CURRENT_VERSION" > "$VERSION_FILE"

# Start the node
exec bitcoincashIId $REINDEX "$@"

#!/bin/bash
# Configuration
BASE_URL="https://download.geofabrik.de"
DOWNLOAD_DIR="./geofabrik_asia"
REGION="asia"

# Check if aria2c is installed
if ! command -v aria2c &> /dev/null; then
    echo "Error: aria2c is not installed. Install it with 'sudo apt install aria2' (Ubuntu/Debian) or 'brew install aria2' (macOS)."
    exit 1
fi

# Create directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

echo "Starting download for Asia into $DOWNLOAD_DIR..."

aria2c -x 16 -s 16 -c -d "$DOWNLOAD_DIR" \
  "$BASE_URL/${REGION}-latest.osm.pbf" \
  "$BASE_URL/${REGION}-latest.osm.pbf.md5" \
  "$BASE_URL/${REGION}.poly"
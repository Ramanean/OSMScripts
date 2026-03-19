#!/bin/bash
# Configuration
BASE_URL="https://download.geofabrik.de"
DOWNLOAD_DIR="./geofabrik_africa"
REGION="africa"

if ! command -v aria2c &> /dev/null; then
    echo "Error: aria2c is not installed."
    exit 1
fi

mkdir -p "$DOWNLOAD_DIR"

aria2c -x 16 -s 16 -c -d "$DOWNLOAD_DIR" \
  "$BASE_URL/${REGION}-latest.osm.pbf" \
  "$BASE_URL/${REGION}-latest.osm.pbf.md5" \
  "$BASE_URL/${REGION}.poly"
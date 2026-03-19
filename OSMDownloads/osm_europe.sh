#!/bin/bash
# Configuration
BASE_URL="https://download.geofabrik.de"
DOWNLOAD_DIR="./geofabrik_europe"
REGION="europe"

if ! command -v aria2c &> /dev/null; then
    echo "Error: aria2c is not installed."
    exit 1
fi

mkdir -p "$DOWNLOAD_DIR"

# Note: Europe is ~32GB, ensure you have space!
aria2c -x 16 -s 16 -c -d "$DOWNLOAD_DIR" \
  "$BASE_URL/${REGION}-latest.osm.pbf" \
  "$BASE_URL/${REGION}-latest.osm.pbf.md5" \
  "$BASE_URL/${REGION}.poly"
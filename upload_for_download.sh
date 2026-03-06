#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
ZIP_PATH="$ROOT_DIR/dist/mone-all-files.zip"

if [[ ! -f "$ZIP_PATH" ]]; then
  echo "ZIP not found at $ZIP_PATH. Run ./create_transfer_zip.sh first." >&2
  exit 1
fi

echo "Uploading $ZIP_PATH to tmpfiles.org ..." >&2
RAW_JSON="$(curl --fail --silent --show-error -F "file=@$ZIP_PATH" https://tmpfiles.org/api/v1/upload)"

PAGE_URL="$(printf '%s' "$RAW_JSON" | python3 -c 'import json,sys; print(json.load(sys.stdin)["data"]["url"])')"
DIRECT_URL="${PAGE_URL/\/tmpfiles.org\//\/tmpfiles.org\/dl\/}"
DIRECT_URL="${DIRECT_URL/http:\/\//https:\/\/}"

echo "$DIRECT_URL"

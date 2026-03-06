#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
OUT_DIR="$ROOT_DIR/dist"
ZIP_PATH="$OUT_DIR/mone-all-files.zip"

mkdir -p "$OUT_DIR"
rm -f "$ZIP_PATH"

cd "$ROOT_DIR"

# Package every tracked file in the repository (excluding .git internals).
git ls-files -z | xargs -0 zip -q "$ZIP_PATH"

echo "Created: $ZIP_PATH"

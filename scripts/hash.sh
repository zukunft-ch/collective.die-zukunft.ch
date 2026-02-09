#!/usr/bin/env bash
# Generate SHA256 hashes for all PDFs in static/pdfs/
set -euo pipefail

PDF_DIR="$(dirname "$0")/../static/pdfs"

if [ ! -d "$PDF_DIR" ]; then
  echo "No pdfs/ directory found."
  exit 0
fi

shopt -s nullglob
files=("$PDF_DIR"/*.pdf)

if [ ${#files[@]} -eq 0 ]; then
  echo "No PDF files found in static/pdfs/"
  exit 0
fi

for f in "${files[@]}"; do
  shasum -a 256 "$f"
done

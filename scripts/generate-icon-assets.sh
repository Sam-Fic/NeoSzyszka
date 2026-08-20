#!/usr/bin/env bash
# Generate native desktop icon assets from the canonical SVG source.
# Requires: librsvg2-bin (rsvg-convert) and icoutils (icotool).
set -euo pipefail

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
ICON_DIR="$ROOT_DIR/data/icons"
ICON_NAME="com.github.samfic.szyszka"
SVG="$ICON_DIR/$ICON_NAME.svg"
PNG="$ICON_DIR/$ICON_NAME.png"
ICO="$ICON_DIR/$ICON_NAME.ico"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

if ! command -v rsvg-convert >/dev/null 2>&1; then
  echo "rsvg-convert is required (install librsvg2-bin)." >&2
  exit 1
fi

if ! command -v icotool >/dev/null 2>&1; then
  echo "icotool is required (install icoutils)." >&2
  exit 1
fi

if [ ! -f "$SVG" ]; then
  echo "Canonical SVG icon not found: $SVG" >&2
  exit 1
fi

# Keep a 1024 px PNG source for macOS @2x iconset generation and high-DPI fallback.
rsvg-convert --width 1024 --height 1024 "$SVG" --output "$PNG"

# Windows chooses the closest image from this multi-resolution ICO at runtime.
SIZES=(16 20 24 32 40 48 64 128 256)
PNG_VARIANTS=()
for size in "${SIZES[@]}"; do
  variant="$WORK_DIR/${ICON_NAME}-${size}.png"
  rsvg-convert --width "$size" --height "$size" "$SVG" --output "$variant"
  PNG_VARIANTS+=("$variant")
done
icotool --create --output "$ICO" "${PNG_VARIANTS[@]}"

echo "Generated:"
printf '  %s\n' "$PNG" "$ICO"

#!/usr/bin/env bash

set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers/static"
TARGET="${1:-All}"

if [[ ! -d "$WALLPAPER_DIR" ]]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR" >&2
    exit 1
fi

if [[ "$TARGET" == "All" ]]; then
    waypaper --random --folder "$WALLPAPER_DIR"
else
    waypaper --random \
        --folder "$WALLPAPER_DIR" \
        --monitor "$TARGET"
fi

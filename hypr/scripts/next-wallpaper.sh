#!/usr/bin/env bash

set -euo pipefail

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
TARGET="${1:-All}"

STATE_DIR="$HOME/.local/state/wallpaper"
STATE_FILE="$STATE_DIR/next-index"

mkdir -p "$STATE_DIR"

mapfile -t WALLPAPERS < <(
    find "$WALLPAPER_DIR" \
        -type f \
        \( \
            -iname '*.jpg' \
            -o -iname '*.jpeg' \
            -o -iname '*.png' \
            -o -iname '*.webp' \
            -o -iname '*.gif' \
        \) \
        | sort
)

if (( ${#WALLPAPERS[@]} == 0 )); then
    echo "No wallpapers found in $WALLPAPER_DIR" >&2
    exit 1
fi

INDEX=0

if [[ -f "$STATE_FILE" ]]; then
    INDEX="$(cat "$STATE_FILE")"
fi

if ! [[ "$INDEX" =~ ^[0-9]+$ ]]; then
    INDEX=0
fi

WALLPAPER="${WALLPAPERS[$INDEX]}"

NEXT_INDEX=$(( (INDEX + 1) % ${#WALLPAPERS[@]} ))

printf '%s\n' "$NEXT_INDEX" > "$STATE_FILE"

if [[ "$TARGET" == "All" ]]; then
    waypaper --wallpaper "$WALLPAPER"
else
    waypaper --wallpaper "$WALLPAPER" --monitor "$TARGET"
fi

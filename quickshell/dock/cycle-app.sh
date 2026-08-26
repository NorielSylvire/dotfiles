#!/bin/bash

CLASS="$1"

mapfile -t WINDOWS < <(
    hyprctl clients -j |
    jq -r --arg class "$CLASS" '
        .[] |
        select(.class == $class) |
        .address
    '
)

[ "${#WINDOWS[@]}" -eq 0 ] && exit 0

ACTIVE=$(hyprctl activewindow -j | jq -r '.address')

for i in "${!WINDOWS[@]}"; do
    if [[ "${WINDOWS[$i]}" == "$ACTIVE" ]]; then
        NEXT=$(( (i + 1) % ${#WINDOWS[@]} ))
        break
    fi
done

if [ -z "$NEXT" ]; then
    NEXT=0
fi

hyprctl dispatch "hl.dsp.focus({ window = \"address:${WINDOWS[$NEXT]}\" })"

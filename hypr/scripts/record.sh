#!/usr/bin/env bash

set -euo pipefail

RECORDING_DIR="$HOME/Videos/Recordings"
TIMESTAMP="$(date '+%Y-%m-%d_%H-%M-%S')"
OUTPUT="$RECORDING_DIR/${TIMESTAMP}.mkv"

mkdir -p "$RECORDING_DIR"

# If wf-recorder is already running, stop it.
if pgrep -x wf-recorder >/dev/null; then
    pkill -INT -x wf-recorder
    exit 0
fi

# Start recording.
case "${1:-screen}" in
    screen)
        wf-recorder -f "$OUTPUT"
        ;;

    dp1)
        wf-recorder -o DP-1 -f "$OUTPUT"
        ;;

    dp2)
        wf-recorder -o DP-2 -f "$OUTPUT"
        ;;

    area)
        GEOMETRY="$(slurp)"
        wf-recorder -g "$GEOMETRY" -f "$OUTPUT"
        ;;

    *)
        echo "Usage: $0 {screen|dp1|dp2|area}"
        exit 1
        ;;
esac

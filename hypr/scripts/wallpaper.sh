#!/usr/bin/env bash

set -euo pipefail

TARGET="${1:-All}"

if [[ "$TARGET" == "All" ]]; then
    waypaper --restore
else
    waypaper --restore --monitor "$TARGET"
fi

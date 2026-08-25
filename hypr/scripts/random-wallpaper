#!/usr/bin/env bash

set -euo pipefail

TARGET="${1:-All}"

if [[ "$TARGET" == "All" ]]; then
    waypaper --random
else
    waypaper --random --monitor "$TARGET"
fi

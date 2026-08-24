#!/usr/bin/env bash

set -euo pipefail

case "${1:-}" in

    # Current monitor → Satty → save
    output)
        GRIMBLAST_EDITOR="satty --actions-on-enter save-to-file --filename" \
            grimblast edit output
        ;;

    # Selected area → Satty → save
    area)
        GRIMBLAST_EDITOR="satty --actions-on-enter save-to-file --filename" \
            grimblast edit area
        ;;

    # Active window → Satty → save
    active)
        GRIMBLAST_EDITOR="satty --actions-on-enter save-to-file --filename" \
            grimblast edit active
        ;;

    # All monitors → Satty → save
    screen)
        GRIMBLAST_EDITOR="satty --actions-on-enter save-to-file --filename" \
            grimblast edit screen
        ;;

    # Current monitor → Satty → save + clipboard
    copy-output)
        GRIMBLAST_EDITOR="satty --actions-on-enter save-to-clipboard,save-to-file --filename" \
            grimblast edit output
        ;;

    # Selected area → Satty → save + clipboard
    copy-area)
        GRIMBLAST_EDITOR="satty --actions-on-enter save-to-clipboard,save-to-file --filename" \
            grimblast edit area
        ;;

    # Active window → Satty → save + clipboard
    copy-active)
        GRIMBLAST_EDITOR="satty --actions-on-enter save-to-clipboard,save-to-file --filename" \
            grimblast edit active
        ;;

    # All monitors → Satty → save + clipboard
    copy-screen)
        GRIMBLAST_EDITOR="satty --actions-on-enter save-to-clipboard,save-to-file --filename" \
            grimblast edit screen
        ;;

    *)
        echo "Usage: $0 {output|area|active|screen|copy-output|copy-area|copy-active|screen}"
        exit 1
        ;;
esac

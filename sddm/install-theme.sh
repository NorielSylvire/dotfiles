#!/usr/bin/env bash

sudo rm -rf /usr/share/sddm/themes/CyberRed && sudo cp -a ~/dotfiles/sddm/CyberRed /usr/share/sddm/themes/CyberRed && sudo chmod -R a+rX /usr/share/sddm/themes/CyberRed

sudo -u sddm namei -l /usr/share/sddm/themes/CyberRed/Backgrounds/wallp-waves.jpg

sudo cp -a ~/dotfiles/sddm/CyberRed/. /usr/share/sddm/themes/CyberRed/

# sudo systemctl restart sddm

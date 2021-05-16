#!/bin/bash
sleep 10 && pacman -Qqn > $HOME/.scripts/bkp-pacman-aur/pacman.txt &&\
    pacman -Qqm > $HOME/.scripts/bkp-pacman-aur/AUR.txt

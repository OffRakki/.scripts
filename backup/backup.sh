#!/bin/bash
sleep 10 && pacman -Qe > $HOME/.scripts/bkp-pacman-aur/pacman.txt &&\
    yay -Qe > $HOME/.scripts/bkp-pacman-aur/AUR.txt

#!/bin/bash
sleep 10 && pacman -Qqn > $HOME/backup/pacman-aur/pacman.txt &&\
    pacman -Qqm > $HOME/backup/pacman-aur/AUR.txt &&\

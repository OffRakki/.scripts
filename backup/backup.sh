#!/bin/bash
sleep 10 && pacman -Qqn > $HOME/backup/pacman-aur/pacman.txt &&\
    pacman -Qqm > $HOME/backup/pacman-aur/AUR.txt &&\
    cp $HOME/.i3/config $HOME/backup/i3 &&\
    cp $HOME/.config/polybar/config $HOME/backup/polybar &&\
    cp $HOME/.config/polybar/launch.sh $HOME/backup/polybar &&\
    cp -r $HOME/.config/dunst $HOME/backup/ &&\
    cp -r $HOME/.config/dmenu-5.0 $HOME/backup/ &&\
    cp -r $HOME/.config/nvim $HOME/backup/ &&\
    cp -r $HOME/.config/neofetch $HOME/backup/ &&\
    cp $HOME/.aliases $HOME/backup/.aliases &&\
    cp $HOME/.zshrc $HOME/backup/.zshrc 

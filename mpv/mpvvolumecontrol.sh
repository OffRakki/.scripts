#!/bin/bash

nome="mpv"
pactl list sink-inputs | grep -e "Sink Input" -e "application.name =" | grep "$nome" -B 1 | head -1 | cut -d '#' -f2


#!/bin/bash

if [ -z "$1" ]; then exit 1; fi
id=$(pactl list sink-inputs | grep -e "Sink Input" -e "application.name =" | grep "$1" -B 1 | head -1 | cut -d '#' -f2)
if [ -z "$id" ]; then exit 2; fi
echo "$id"

if [ -z "$1" ]; then exit 1; fi
volume=$(pactl list sink-inputs | grep -e "Sink Input" -e "Volume: " | grep -e "#$1" -A 1 | tail -1 | cut -d '/' -f2 | xargs)
if [ -z "$volume" ]; then exit 2; fi
echo "$volume"

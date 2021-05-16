#!/bin/bash

pactl list sink-inputs | grep -e "Sink Input" -e "Volume: " | grep -e "#$(idmpv)" -A 1 | tail -1 | cut -d '/' -f2 | xargs

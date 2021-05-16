#!/bin/bash

xsetwacom set "Wacom Intuos S 2 Pen stylus" Area 1000 1000 7000 3600
xsetwacom -s --set "Wacom Intuos S 2 Pen stylus" Button 2 "button 0"
xsetwacom -s --set "Wacom Intuos S 2 Pen stylus" Button 3 "button 0"
xsetwacom set "Wacom Intuos S 2 Pen stylus" Suppress 0
xsetwacom set "Wacom Intuos S 2 Pen stylus" RawSample 1

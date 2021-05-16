#!/bin/env bash

youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" --merge-output-format mp4 $1 -o "~/yt-downloads/%(title)s.%(ext)s" && notify-send "Video Download finished sucessfully"

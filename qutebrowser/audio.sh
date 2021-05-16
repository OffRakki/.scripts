#!/bin/env bash

alacritty -e mpv --ytdl-format=bestaudio ytdl://ytsearch:$1

#!/usr/bin/env bash

if pgrep spotify > /dev/null
    then 
        exec mpris-ctl --player Spotify info
    else
        exec mpris-ctl --player inactive
fi

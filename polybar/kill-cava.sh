#!/usr/bin/env bash

pid=$(echo /tmp/polybar-cava* | cut -d '.' -f 2) &&
    kill $pid

rm /tmp/polybar-cava.$pid

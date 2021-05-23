#!/usr/bin/env bash

pid=$(echo /tmp/polybar-tray* | cut -d '.' -f 2) &&
    kill $pid

rm /tmp/polybar-tray.$pid

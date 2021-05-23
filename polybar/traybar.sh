#!/usr/bin/env bash

polybar tray &
pid=$!
ln -s /tmp/polybar_mqueue.$pid /tmp/polybar-tray.$pid

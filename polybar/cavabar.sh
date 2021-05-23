#!/usr/bin/env bash

polybar cavabar &
pid=$!
ln -s /tmp/polybar_mqueue.$pid /tmp/polybar-cava.$pid

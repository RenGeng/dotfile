#!/usr/bin/env bash

sketchybar -m --set "widgets.ram" label="$(memory_pressure | awk '/free percentage/ {printf "%02.0f", 100-$5}')%"

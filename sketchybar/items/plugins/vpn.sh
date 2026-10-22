#!/bin/bash

VPN=$(scutil --nc list | sed -nE '/Connected/s/.*"(.*)".*/\1/p')

if [[ $VPN != "" ]]; then
  sketchybar -m --set widgets.vpn icon= \
                          label="$VPN" \
                          drawing=on
else
  sketchybar -m --set widgets.vpn drawing=off
fi

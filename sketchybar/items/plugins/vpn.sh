#!/bin/bash

VPN=$(scutil --nc list | grep Connected | sed -E 's/.*"(.*)".*/\1/')

if [[ $VPN != "" ]]; then
  sketchybar -m --set widgets.vpn icon= \
                          label="$VPN" \
                          drawing=on
else
  sketchybar -m --set widgets.vpn drawing=off
fi

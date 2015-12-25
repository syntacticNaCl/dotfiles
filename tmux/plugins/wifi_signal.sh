#!/bin/sh
#
# adapted from https://github.com/carsonmcdonald/tmux-wifi-os-x
# Converted script to use percentages instead
#

all_signal=(▁ ▃ ▅ ▇ )

current=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | egrep "agrCtlRSSI|state|lastTxRate| SSID" | cut -d: -f2 | tr "\\n" ";" | sed 's/^[ ]//g'`

if [ "$current" == "" ]
then
  echo "(WIFI off)"
fi

strength=`echo $current | cut -d";" -f1-1 | cut -d" " -f2-`
state=`echo $current | cut -d";" -f2-2 | cut -d" " -f2-`
bandwidth=`echo $current | cut -d";" -f3-3 | cut -d" " -f2-`
name=`echo $current | cut -d";" -f4-4 | cut -d" " -f2-`

if [ "$state" != "running" ]
then
  echo "(WIFI off)"
fi

strengthPerc=${strength/-/''}'%' 

echo "${strengthPerc} ${name} ${bandwidth}Mbps" 

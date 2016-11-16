#!/bin/bash

if [[ -z $1 ]]; then
    echo "Enter up | down"
    exit 1
fi

if [[ $1 == "up" ]]; then
    wpa_supplicant -i wlan0 -B -s -c /etc/wpa_supplicant/ostrovok.conf
fi

if [[ $1 == "down" ]]; then
    killall wpa_supplicant
fi


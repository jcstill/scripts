#!/bin/bash

# My i3 lock control script
# Copyright (C) 2020, Jacob Still github.com/jcstill
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see https://www.gnu.org/licenses/

# Pause media
if [ "$(playerctl status)" == "Playing" ];then
	playerctl stop
	echo 1 > ~/.config/i3lock-modified/config
else
	echo 0 > ~/.config/i3lock-modified/config
fi

# Turn off speakers after a time
#CURRENT="$(pacmd list-sinks | grep 'index:\|name:' | grep '*' -A 1 | tail -1 | awk '{print $2;}' | sed 's|[<>,]||g')"
#echo "$CURRENT"
#if [ "$CURRENT" == "alsa_output.pci-0000_00_1f.3.analog-stereo" ];then
#	echo "audiosink off"
#fi
#exit

# Enable Screen Timeout
xset s default
xset s 10
# Lock the screen
~/.config/i3lock-modified/lock.sh
# Disable Screen Timeout
xset -dpms
xset s noblank
xset s off
# If media was playing before locking, play agian
if [ "$(cat ~/.config/i3lock-modified/config)" == "1" ];then
	playerctl play
fi

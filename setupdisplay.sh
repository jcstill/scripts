#!/bin/bash

# Configure video outputs based on connected monitors
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

DP0="$(xrandr | grep DisplayPort | head -1 | tail -1 | awk '{print $2}')"
DP1="$(xrandr | grep DisplayPort | head -2 | tail -1 | awk '{print $2}')"
DP2="$(xrandr | grep DisplayPort | head -3 | tail -1 | awk '{print $2}')"
DP3="$(xrandr | grep DisplayPort | head -4 | tail -1 | awk '{print $2}')"

if [ "$DP0" == "connected" ] && [ "$DP1" == "disconnected" ] && [ "$DP2" == "disconnected" ];then
	echo dp0
	xrandr \
	--output DisplayPort-0 \
		--mode 1920x1080 \
		--pos 0x0 \
		--rotate normal \
		--scale 1.0x1.0
elif [ "$DP0" == "connected" ] && [ "$DP1" == "connected" ] && [ "$DP2" == "disconnected" ];then
	echo dp1
	xrandr \
	--output DisplayPort-0 \
		--mode 1920x1080 \
		--pos 0x0 \
		--rotate normal \
		--scale 1.0x1.0 \
	--output DisplayPort-1 \
		--mode 1920x1080 \
		--pos -1920x0 \
		--rotate normal \
		--scale 1.0x1.0
elif [ "$DP0" == "connected" ] && [ "$DP1" == "connected" ] && [ "$DP2" == "connected" ];then
	echo dp2
	xrandr \
	--output DisplayPort-0 \
		--mode 1920x1080 \
		--pos 0x0 \
		--rotate normal \
		--scale 1.0x1.0 \
	--output DisplayPort-1 \
		--mode 1920x1080 \
		--pos -1920x0 \
		--rotate normal \
		--scale 1.0x1.0 \
	--output DisplayPort-2 \
		--mode 1920x1080 \
		--pos 3840x0 \
		--rotate normal \
		--scale 1.0x1.0
fi

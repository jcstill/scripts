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

if [ "$1" == "desktop" ];then
	echo "desktop mode"
	xrandr \
	--output DisplayPort-0 --mode 1920x1080 --pos 0x0 --rotate normal --scale 1.0x1.0 --primary
	xrandr \
	--output DisplayPort-1 --mode 1920x1080 --pos -1920x0 --rotate normal --scale 1.0x1.0
	sleep 5
	xrandr \
	--output DisplayPort-2 --off
	~/.config/polybar/launch.sh &
elif [ "$1" == "movie" ];then
	echo "movie mode"
	xrandr \
	--output DisplayPort-2 --mode 3840x2160 --pos 3840x0 --rotate normal --scale 0.5x0.5
	sleep 5
	xrandr \
	--output DisplayPort-0 --off --primary \
	--output DisplayPort-1 --off
	~/.config/polybar/launch.sh &
#elif [ "$1" == "all" ];then
#	echo "all on"
#	xrandr \
#	--output DisplayPort-0 --mode 1920x1080 --pos 0x0 --rotate normal --scale 1.0x1.0 --primary
#	xrandr \
#	--output DisplayPort-1 --mode 1920x1080 --pos -1920x0 --rotate normal --scale 1.0x1.0
#	sleep 5
#	xrandr \
#	--output DisplayPort-2 --mode 3840x2160 --pos 3840x0 --rotate normal --scale 0.5x0.5
#	~/.config/polybar/launch.sh &
elif [ "$1" == "auto" ] || [ "$1" == "all" ];then
	echo "Using automatic mode"
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
		echo "dp0 dp1"
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
		echo "dp0 dp1 dp2"
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
			--mode 3840x2160 \
			--pos 3840x0 \
			--rotate normal \
			--scale 0.5x0.5
	fi
	~/.config/polybar/launch.sh &
else
	echo "usage:"
	echo "setupdisplay <options>"
	echo "	desktop		only dp0 and dp1"
	echo "	movie		only dp2"
	echo "	all		all on"
	echo "	auto		automatic detect"
fi

#if [ "$DP0" == "connected" ] && [ "$DP1" == "disconnected" ] && [ "$DP2" == "disconnected" ];then
#	echo "dp0"
#	xrandr \
#	--output DisplayPort-0 \
#		--mode 1920x1080 \
#		--pos 0x0 \
#		--rotate normal \
#		--scale 1.0x1.0
#elif [ "$DP0" == "connected" ] && [ "$DP1" == "connected" ] && [ "$DP2" == "disconnected" ];then
#	echo "dp0 dp1"
#	xrandr \
#	--output DisplayPort-0 \
#		--mode 1920x1080 \
#		--pos 0x0 \
#		--rotate normal \
#		--scale 1.0x1.0 \
#	--output DisplayPort-1 \
#		--mode 1920x1080 \
#		--pos -1920x0 \
#		--rotate normal \
#		--scale 1.0x1.0
#elif [ "$DP0" == "connected" ] && [ "$DP1" == "connected" ] && [ "$DP2" == "connected" ];then
#	echo "dp0 dp1 dp2"
#	xrandr \
#	--output DisplayPort-0 \
#		--mode 1920x1080 \
#		--pos 0x0 \
#		--rotate normal \
#		--scale 1.0x1.0 \
#	--output DisplayPort-1 \
#		--mode 1920x1080 \
#		--pos -1920x0 \
#		--rotate normal \
#		--scale 1.0x1.0
#	if [ "$2" == "1080" ] || [ "$2" == "1080p" ] || [ "$2" == "1080P" ]; then
#		echo "dp2 1080p"
#		xrandr \
#		--output DisplayPort-2 \
#			--mode 1920x1080 \
#			--pos 3840x0 \
#			--rotate normal \
#			--scale 1.0x1.0
#	else
#		echo "dp2 4k"
#		xrandr \
#		--output DisplayPort-2 \
#			--mode 3840x2160 \
#			--pos 3840x0 \
#			--rotate normal \
#			--scale 0.5x0.5
#	fi
#fi


#xrandr --output DisplayPort-2 --mode 3840x2160 --pos 3840x0 --rotate normal --scale 0.5x0.5
#xrandr --output DisplayPort-2 --mode 1920x1080 --pos 3840x0 --rotate normal --scale 1.0x1.0



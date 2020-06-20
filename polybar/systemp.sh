#!/bin/bash

# Show CPU (and GPU if too high) temp as a percent (Used by my Polybar setup)
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

re='^[0-9]+$'
# Get CPU hwmon number (it changes i guess ??)
for i in {0..10}; do
	LOC="$(cat /sys/class/hwmon/hwmon"$i"/name)"
	if [ "$LOC" == "coretemp" ]; then
		LOC=$i
		break
	fi
done
# Make sure it exists
if ! [[ $LOC =~ $re ]] ; then
	exit 1
fi
# Get CPU core temps and avg them
CPUAVG=0
for i in {2..100}; do
	[ -r /sys/class/hwmon/hwmon"$LOC"/temp"$i"_input ] && \
	NUM="$(cat /sys/class/hwmon/hwmon"$LOC"/temp"$i"_input)" && \
	CPUAVG=$((CPUAVG + NUM)) #individual core temps
done
CPUAVG="$(bc <<< "scale = 1; $CPUAVG / 8 / 1000")"
CPUAVG="$(bc <<< "scale = 1; ($CPUAVG * 1.8) + 32")" # Convert to freedom units
# Get GPU hwmon number
for i in {0..10}; do
	LOC="$(cat /sys/class/hwmon/hwmon"$i"/name)"
	if [ "$LOC" == "amdgpu" ]; then
		LOC=$i
		break
	fi
done
# Make sure it exists
if ! [[ $LOC =~ $re ]] ; then
		exit 1
fi
# Get GPU temp
AMDGPU="$(cat /sys/class/hwmon/hwmon"$LOC"/temp1_input)" #amdgpu temp
OUTPUT=""
# Check that GPU is below mfr rated temp else warn user
if [[ $AMDGPU -gt 89000 ]]; then
	AMDGPU="$(bc <<< "scale = 1; $AMDGPU / 1000")"
	AMDGPU="$(bc <<< "scale = 1; ($AMDGPU * 1.8) + 32")" # Convert to freedom units
	OUTPUT="GPU: $AMDGPU°F!!!"
else
	OUTPUT="$CPUAVG°F"
fi
# Check for input specifying GPU temp
if [ -z "$1" ]; then
	echo "$OUTPUT"
elif [ $1 == 'G' ]; then
	AMDGPU="$(bc <<< "scale = 1; $AMDGPU / 1000")"
		AMDGPU="$(bc <<< "scale = 1; ($AMDGPU * 1.8) + 32")" # Convert to freedom units
	echo "$AMDGPU°F"
fi





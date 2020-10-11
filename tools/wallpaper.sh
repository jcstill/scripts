#!/bin/bash

# Set the wallpaper based on the monitors connected
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

PWD="$1"
FULL="$2"
SHORT="$3"
TV="$(monitor --show short|grep 'DisplayPort-2'|cut -d ' ' -f 2)"
if [ "$TV" != "off" ];then
	echo full
	feh --no-xinerama --bg-fill "$PWD$FULL"
else
	echo short
	feh --no-xinerama --bg-fill "$PWD$SHORT"
fi
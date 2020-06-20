#!/bin/bash

# Show the current resolution of the tv (Used by my Polybar setup)
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

RES="$(xrandr | grep '*' | tail -1 | awk '{print $1;}')"
if [ "$RES" == "1920x1080" ]; then
	echo "1080p"
elif [ "$RES" == "3840x2160" ]; then
	echo "4K"
fi

#!/bin/bash

# Show wireless mouse battery as a percent (Used by my Polybar setup)
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

STATE="$(upower -d|grep -B 2 -A 14 "MX Master 3"|sed -n 12p|awk '{print $2}')"
PERCENT="$(upower -d|grep -B 2 -A 14 "MX Master 3"|sed -n 15p|awk '{print $2}')"
if [ "$STATE" == "unknown" ];then
	echo "Mouse: $STATE"
else
	echo "Mouse: $PERCENT"
fi

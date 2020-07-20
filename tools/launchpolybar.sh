#!/bin/bash

# Script to launch/relaunch polybar
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

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null;do
	sleep 1
done

# Launch Bars
# polybar DP0 >> /dev/null 2>&1 &
# polybar DP1 >> /dev/null 2>&1 &
# polybar DP2 >> /dev/null 2>&1 &

polybar DP0 &2> /dev/null
polybar DP1 &2> /dev/null
polybar DP2 &2> /dev/null

echo "Bars launched..."


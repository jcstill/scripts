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

# Speaker timeout in minutes
T=10

# Media control
audiosink lock $((T*60)) &
TIMEPID=$!

# Enable Screen Timeout
xset s default
xset s 10

# Lock the screen
~/.config/i3lock-modified/lock.sh

# Disable Screen Timeout
xset -dpms
xset s noblank
xset s off

# Media control
kill $TIMEPID > /dev/null 2>&1
wait $! 2>/dev/null
sleep 1
audiosink unlock

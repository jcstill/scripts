#!/bin/bash

# Show a small calendar using rofi (Used by my Polybar setup)
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

DATEFTM="${DATEFTM:-+%B}"
MONTH=$(date "$DATEFTM")
date=$(date '+%a, %d. %B')
year=$(date '+%Y')
month=$(date '+%m')

ncal -hb $month $year \
| sed 's/\x1b\[[7;]*m/\<b\>\<u\>/g' \
| sed 's/\x1b\[[27;]*m/\<\/u\>\<\/b\>/g' \
| tail -n +2 \
| rofi -dmenu -markup-rows -lines 6 -width 13 -xoffset 740 -yoffset -429 -line-padding 5 -i -p "$date" -click-to-exit > /dev/null 

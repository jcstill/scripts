#!/bin/bash

# My i3 lock configurations
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

IMAGE=/tmp/screen.png
scrot $IMAGE
# -sharpen 0x4 -blur 0x2
convert $IMAGE -scale 5% -scale 2000% -blur 0x1 -draw "fill '#00000060' rectangle 2830,940 1920,720" -fill none -stroke '#00DBB360' -strokewidth 3 -draw "rectangle 2830,940 1922,720" $IMAGE

B='#00000000'	# blank
D='#0071DBFF'	# default
T='#FFFFFFFF'	# text
H='#DBB300FF'	# highlight
W='#DB2100FF'	# wrong

i3lock -n -i $IMAGE			\
--ringcolor=$D				\
--insidecolor=$B			\
\
--ringvercolor=$D			\
--insidevercolor=$B			\
\
--ringwrongcolor=$W			\
--insidewrongcolor=$B			\
\
--linecolor=$B				\
--separatorcolor=$H			\
--verifcolor=$T				\
--wrongcolor=$T				\
--timecolor=$T				\
--datecolor=$T				\
--layoutcolor=$B			\
--keyhlcolor=$H				\
--bshlcolor=$H				\
\
--screen 1				\
--clock					\
--indicator				\
--keylayout 2				\
--indpos="x+800:h-250"			\
--radius=90				\
--ring-width=7				\
\
--timestr="%H:%M"			\
--timesize=150				\
--time-align 2				\
--timepos="ix-110:iy+27"		\
\
--datestr="%m/%d/%Y"			\
--datesize=50				\
--date-align 2				\
--datepos="ix-110:iy+82"		\
\
--veriftext="..."			\
--wrongtext="Incorrect"			\
--noinputtext=""			\
\
--ignore-empty-password \

rm $IMAGE

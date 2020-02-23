#!/bin/bash

# Show power menu using rofi (Used by my Polybar setup)
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

S="$(printf "Lock\nLogout\nSleep\nHibernate\nReboot\nShutdown\n" | rofi -lines 6 -width 20 -dmenu -line-padding 5 -i -p 'System' -click-to-exit)"
case "$S" in
	"Lock"|"lock"|"L"|"l")
		#echo "$S"
		~/.config/i3lock-modified/timeoutcontrol.sh
		;;
	"Logout")
		#echo "$S"
		playerctl pause
		i3-msg exit
		;;
	"Sleep"|"sleep"|"S"|"s")
		#echo "$S"
		~/.config/i3lock-modified/timeoutcontrol.sh
		sleep 2s
		systemctl suspend
		;;
	"Hibernate")
		#echo "$S"
		~/.config/i3lock-modified/timeoutcontrol.sh
		sleep 2s
		systemctl hibernate
		;;
	"Reboot")
		#echo "$S"
		playerctl pause
		systemctl reboot
		;;
	"Shutdown")
		#echo "$S"
		playerctl pause
		systemctl poweroff
		;;
esac

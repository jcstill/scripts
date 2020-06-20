#!/bin/bash

# Show remaining tasks from todo.py (Used by my Polybar setup)
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

NUM="$(todo -n | head -1 | awk '{print $3}')"
TASK="$(todo -n | grep Today | head -1 | cut -c5-)"
if [ ! -z "$TASK" ];then
	echo "Todo [$NUM]: $TASK"
	exit
fi
TASK="$(todo -n | grep Tomorrow | head -1 | cut -c5-)"
if [ ! -z "$TASK" ];then
	echo "Todo [$NUM]: $TASK"
	exit
fi
if [ "$NUM" == "left" ];then
	NUM="0"
fi
echo "Todo [$NUM]"

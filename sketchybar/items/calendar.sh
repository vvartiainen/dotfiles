#!/bin/bash

sketchybar --add item calendar right \
	--set calendar icon=􀧞 \
	--set calendar icon.color="$PEACH" \
	--set calendar label.color="$LABEL_COLOR" \
	update_freq=30 \
	script="$PLUGIN_DIR/calendar.sh"

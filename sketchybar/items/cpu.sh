#!/bin/bash

source "$CONFIG_DIR/colors.sh"

sketchybar --add item cpu right \
	--set cpu update_freq=2 \
	icon=􀧓 \
	--set cpu icon.color="$PEACH" \
	--set cpu label.color="$LABEL_COLOR" \
	script="$PLUGIN_DIR/cpu.sh"

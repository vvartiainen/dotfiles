#!/bin/bash

SPACE_SIDS=(1 2 3 4 5 6 7 8 9 10)

source "$CONFIG_DIR/colors.sh"

for sid in "${SPACE_SIDS[@]}"; do
	sketchybar --add space space."$sid" left \
		--set space."$sid" space="$sid" \
		icon="$sid" \
		label.font="sketchybar-app-font:Regular:16.0" \
		label.padding_right=20 \
		label.y_offset=-1 \
		script="$PLUGIN_DIR/space.sh"
done

sketchybar --add item space_separator left \
	--set space_separator icon="􀆊" \
	--set space_separator icon.color="$GREEN" \
	icon.padding_left=4 \
	label.drawing=off \
	background.drawing=off \
	script="$PLUGIN_DIR/space_windows.sh" \
	--subscribe space_separator space_windows_change

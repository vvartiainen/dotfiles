#!/bin/bash

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

source "$CONFIG_DIR/colors.sh"

if [ "$SELECTED" = true ]; then
	sketchybar --set "$NAME" background.drawing=on \
		background.color="$SURFACE1" \
		--set "$NAME" label.color="$PEACH" \
		--set "$NAME" icon.color="$LABEL_COLOR"
else
	sketchybar --set "$NAME" background.drawing=off \
		--set "$NAME" label.color="$PEACH" \
		--set "$NAME" icon.color="$LABEL_COLOR"
fi

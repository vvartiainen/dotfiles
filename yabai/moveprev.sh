#!/bin/bash

function get_window_id() {
	yabai -m query --windows --window | jq '.id'
}

function move_window_prev_space() {
	local window_id
	window_id=$(get_window_id)
	yabai -m window "$window_id" --space prev
	yabai -m space --focus prev
	yabai -m window --focus "$window_id"
}

function move_window_next_space() {
	local window_id
	window_id=$(get_window_id)
	yabai -m window "$window_id" --space next
	yabai -m space --focus next
	yabai -m window --focus "$window_id"
}

move_window_prev_space

local wezterm = require("wezterm")

return {
	font_size = 12.0,
	keys = {
		-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
		-- Make Option-Right equivalent to Alt-f; forward-word
		{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },

		-- CMD + LEFT to move tabs
		{ key = "LeftArrow", mods = "CMD", action = wezterm.action({ ActivateTabRelative = -1 }) },
		-- CMD + RIGHT to move tabs
		{ key = "RightArrow", mods = "CMD", action = wezterm.action({ ActivateTabRelative = 1 }) },
	},
	color_scheme = "Catppuccin Mocha",
	send_composed_key_when_left_alt_is_pressed = true,
}

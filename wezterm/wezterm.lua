local wezterm = require("wezterm")

return {
	font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" }),
	font_size = 16.0,
	keys = {
		-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
		{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
		-- Make Option-Right equivalent to Alt-f; forward-word
		{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },

		-- CMD + LEFT to move tabs
		{ key = "LeftArrow", mods = "CMD", action = wezterm.action({ ActivateTabRelative = -1 }) },
		-- CMD + RIGHT to move tabs
		{ key = "RightArrow", mods = "CMD", action = wezterm.action({ ActivateTabRelative = 1 }) },
		-- Move tab to left with ctrl+cmd
		{ key = "LeftArrow", mods = "CMD|CTRL", action = wezterm.action({ MoveTabRelative = -1 }) },
		-- Move tab to right with ctrl+cmd
		{ key = "RightArrow", mods = "CMD|CTRL", action = wezterm.action({ MoveTabRelative = 1 }) },
	},
	color_scheme = "Catppuccin Mocha",
	send_composed_key_when_left_alt_is_pressed = true,
}

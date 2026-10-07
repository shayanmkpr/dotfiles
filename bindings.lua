o.bind("CTRL + SHIFT + C", nil, "omarchy-capture-screenshot")

hl.config({
	input = {
		kb_layout = "us,ir",
		kb_variant = ",",
		kb_options = "grp:ctrl_space_toggle",
	}
})

hl.config({
	general = {
		-- No gaps between windows or borders.
		gaps_in = 2,
		gaps_out = 6,
		border_size = 2,

		-- Change to niri-like side-scrolling layout.
		layout = "scrolling",
	},
})

hl.config({
	decoration = {
		-- Use round window corners.
		rounding = 8,

		-- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
		-- dim_inactive = true,
		-- dim_strength = 0.1,
	},
})

hl.config({
	decoration = {
		blur = {
			enabled = true,
			size = 3,
			passes = 3,
		},
	},
})

local omarchy_gdk_scale = 1
local omarchy_monitor_scale = 1.25

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })
hl.monitor({ output = "DP-2", mode = "preferred", position = "0x0", scale = 1.25 })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1.6 })

hl.workspace_rule({
	workspace = "r[1-6]",
	monitor = "DP-2",
})

hl.workspace_rule({
	workspace = "7",
	monitor = "eDP-1",
	default = true,
})

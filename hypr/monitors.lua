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

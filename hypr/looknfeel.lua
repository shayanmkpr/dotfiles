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

------------------
---- MONITORS ----
------------------

-- Secondary monitor — left
hl.monitor({
    output   = "DP-1",
    mode     = "1920x1200@60.00000",
    position = "0x0",
    scale    = 1,
})

-- Main monitor — right
hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@60.00000",
    position = "1920x0",
    scale    = 1,
})

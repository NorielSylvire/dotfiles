-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Example:
--
-- hl.on("hyprland.start", function()
--     hl.exec_cmd(programs.terminal)
--     hl.exec_cmd("waybar")
--     hl.exec_cmd("mako")
-- end)

hl.on("hyprland.start", function()
    hl.exec_cmd("hypridle")
	hl.exec_cmd("waybar")
end)

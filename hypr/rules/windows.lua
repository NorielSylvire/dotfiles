--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

----------------------------
---- MAXIMIZE EVENTS -------
----------------------------

hl.window_rule({
    name = "suppress-maximize-events",
    match = {
        class = ".*",
    },

    suppress_event = "maximize",
})


----------------------------
---- XWAYLAND DRAGGING -----
----------------------------

hl.window_rule({
    name = "fix-xwayland-drags",

    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
})


----------------------------
---- HYPRLAND RUN ----------
----------------------------

hl.window_rule({
    name = "move-hyprland-run",

    match = {
        class = "hyprland-run",
    },

    move = "20 monitor_h-120",
    float = true,
})


----------------------------
---- OBSIDIAN --------------
----------------------------

hl.window_rule({
    name = "tile-obsidian",

    match = {
        class = "^md%.obsidian%.Obsidian$",
    },

    tile = true,
})


----------------------------
---- WAYPAPER  -------------
----------------------------

hl.window_rule({
    name = "waypaper-floating",
    match = {
        class = "^waypaper$",
    },

    float = true,
})

----------------------------
---- BLUEMAN  -------------
----------------------------

hl.window_rule({
	match = {
		class = "blueman-manager",
	},

	float = true,

	size = "420 500",

	move = {
		"monitor_w - window_w - 10",
		"58",
	},
})

----------------------------
---- VOLUME MIXER ---------
----------------------------

hl.window_rule({
    match = {
        class = "org.pulseaudio.pavucontrol",
    },

    float = true,

    size = "520 500",

    move = {
        "monitor_w - window_w - 10",
        "58",
    },
})

-----------------------------
----- KITTY FLOATING --------
-----------------------------

hl.window_rule({
    match = {
        class = "kitty-floating",
    },
    float = true,
})

-----------------------------
--- THUNAR RENAME FLOATING --
-----------------------------


hl.window_rule({
    name = "rename-floating",

    match = {
        class = "^thunar$",
        title = "^Rename.*$",
    },

    float = true,
})

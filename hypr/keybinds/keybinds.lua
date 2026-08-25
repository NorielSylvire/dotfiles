---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"


----------------
---- PROGRAMS --
----------------

hl.bind(
    mainMod .. " + Q",
    hl.dsp.exec_cmd(programs.terminal)
)

hl.bind(
    mainMod .. " + E",
    hl.dsp.exec_cmd(programs.fileManager)
)

hl.bind(
    mainMod .. " + R",
    hl.dsp.exec_cmd(programs.menu)
)


----------------
---- WINDOWS ---
----------------

hl.bind(
    mainMod .. " + C",
    hl.dsp.window.close()
)

hl.bind(
    mainMod .. " + V",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind(
    mainMod .. " + P",
    hl.dsp.window.pseudo()
)

hl.bind(
    mainMod .. " + J",
    hl.dsp.layout("togglesplit")
)

hl.bind(
    mainMod .. " + F",
    hl.dsp.window.fullscreen()
)

----------------
---- EXIT ------
----------------

hl.bind(
    mainMod .. " + M",
    hl.dsp.exec_cmd(
        "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
    )
)


----------------
---- FOCUS -----
----------------

hl.bind(
    mainMod .. " + left",
    hl.dsp.focus({ direction = "left" })
)

hl.bind(
    mainMod .. " + right",
    hl.dsp.focus({ direction = "right" })
)

hl.bind(
    mainMod .. " + up",
    hl.dsp.focus({ direction = "up" })
)

hl.bind(
    mainMod .. " + down",
    hl.dsp.focus({ direction = "down" })
)


--------------------
---- WORKSPACES ----
--------------------

for i = 1, 10 do
    local key = i % 10

    hl.bind(
        mainMod .. " + " .. key,
        hl.dsp.focus({ workspace = i })
    )

    hl.bind(
        mainMod .. " + SHIFT + " .. key,
        hl.dsp.window.move({ workspace = i })
    )
end


--------------------
---- SCRATCHPAD ----
--------------------

hl.bind(
    mainMod .. " + S",
    hl.dsp.workspace.toggle_special("magic")
)

hl.bind(
    mainMod .. " + SHIFT + S",
    hl.dsp.window.move({
        workspace = "special:magic",
    })
)


-------------------------
---- WORKSPACE SCROLL ----
-------------------------

hl.bind(
    mainMod .. " + mouse_down",
    hl.dsp.focus({ workspace = "e+1" })
)

hl.bind(
    mainMod .. " + mouse_up",
    hl.dsp.focus({ workspace = "e-1" })
)


--------------------
---- MOUSE ---------
--------------------

hl.bind(
    mainMod .. " + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    mainMod .. " + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)


--------------------
---- MEDIA KEYS ----
--------------------

hl.bind(
    "XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
    { locked = true, repeating = true }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
    { locked = true, repeating = true }
)


--------------------
---- MEDIA PLAYER ---
--------------------

hl.bind(
    "XF86AudioNext",
    hl.dsp.exec_cmd("playerctl next"),
    { locked = true }
)

hl.bind(
    "XF86AudioPause",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPlay",
    hl.dsp.exec_cmd("playerctl play-pause"),
    { locked = true }
)

hl.bind(
    "XF86AudioPrev",
    hl.dsp.exec_cmd("playerctl previous"),
    { locked = true }
)

---------------------
---- SCREENSHOTS ----
---------------------

local screenshot = "~/.local/bin/screenshot"

-- Print
-- Current monitor → Satty → save
hl.bind(
    "Print",
    hl.dsp.exec_cmd(screenshot .. " output")
)

-- Super + Print
-- Selected area → Satty → save
hl.bind(
    mainMod .. " + Print",
    hl.dsp.exec_cmd(screenshot .. " area")
)

-- Shift + Print
-- Current monitor → Satty → save + clipboard
hl.bind(
    "SHIFT + Print",
    hl.dsp.exec_cmd(screenshot .. " copy-output")
)

-- Super + Shift + Print
-- Selected area → Satty → save + clipboard
hl.bind(
    mainMod .. " + SHIFT + Print",
    hl.dsp.exec_cmd(screenshot .. " copy-area")
)

-- Ctrl + Print
-- Active window → Satty → save
hl.bind(
    "CTRL + Print",
    hl.dsp.exec_cmd(screenshot .. " active")
)

-- Ctrl + Shift + Print
-- Active window → Satty → save + clipboard
hl.bind(
    "CTRL + SHIFT + Print",
    hl.dsp.exec_cmd(screenshot .. " copy-active")
)

-- Alt + Print
-- All monitors → Satty → save
hl.bind(
    "ALT + Print",
    hl.dsp.exec_cmd(screenshot .. " screen")
)

-- Alt + Shift + Print
-- All monitors → Satty → save + clipboard
hl.bind(
    "ALT + SHIFT + Print",
    hl.dsp.exec_cmd(screenshot .. " copy-screen")
)

---------------------
---- WALLPAPER ----
--------------------

------------------------
---- RANDOM WALLPAPER --
------------------------

-- All monitors
hl.bind(
    mainMod .. " + SHIFT + W",
    hl.dsp.exec_cmd("random-wallpaper")
)

-- DP-1
hl.bind(
    mainMod .. " + SHIFT + 1 + W",
    hl.dsp.exec_cmd("random-wallpaper DP-1")
)

-- DP-2
hl.bind(
    mainMod .. " + SHIFT + 2 + W",
    hl.dsp.exec_cmd("random-wallpaper DP-2")
)

----------------------
---- RANDOM STATIC ---
----------------------

-- All monitors
hl.bind(
    mainMod .. " + CTRL + W",
    hl.dsp.exec_cmd("random-static")
)

-- DP-1
hl.bind(
    mainMod .. " + CTRL + 1 + W",
    hl.dsp.exec_cmd("random-static DP-1")
)

-- DP-2
hl.bind(
    mainMod .. " + CTRL + 2 + W",
    hl.dsp.exec_cmd("random-static DP-2")
)

-------------------------
---- RANDOM ANIMATED ----
-------------------------

-- All monitors
hl.bind(
    mainMod .. " + ALT + W",
    hl.dsp.exec_cmd("random-animated")
)

-- DP-1
hl.bind(
    mainMod .. " + ALT + 1 + W",
    hl.dsp.exec_cmd("random-animated DP-1")
)

-- DP-2
hl.bind(
    mainMod .. " + ALT + 2 + W",
    hl.dsp.exec_cmd("random-animated DP-2")
)

---------------------
---- NEXT WALLPAPER --
---------------------

-- All monitors
hl.bind(
    mainMod .. " + N",
    hl.dsp.exec_cmd("next-wallpaper")
)

-- DP-1
hl.bind(
    mainMod .. " + N + 1",
    hl.dsp.exec_cmd("next-wallpaper DP-1")
)

-- DP-2
hl.bind(
    mainMod .. " + N + 2",
    hl.dsp.exec_cmd("next-wallpaper DP-2")
)

---------------------
---- WAYPAPER GUI ---
---------------------

-- All monitors
hl.bind(
    mainMod .. " + W",
    hl.dsp.exec_cmd("waypaper")
)

---------------------
--- RECORD SCREEN ---
---------------------

hl.bind(
	mainMod .. " + SHIFT + R",
	hl.dsp.exec_cmd("record screen")
)

hl.bind(
	mainMod .. " + SHIFT + R + 1",
	hl.dsp.exec_cmd("record dp1")
)

hl.bind(
	mainMod .. " + SHIFT + R + 2",
	hl.dsp.exec_cmd("record dp2")
)

hl.bind(
	mainMod .. " + SHIFT + R + A",
	hl.dsp.exec_cmd("record area")
)

----------------------
---- ROFI KEYBINDS ---
----------------------

hl.bind(
	mainMod .. " + D",
	hl.dsp.exec_cmd("rofi -show drun")
)

hl.bind(
	mainMod .. " + R",
	hl.dsp.exec_cmd("rofi -show run")
)

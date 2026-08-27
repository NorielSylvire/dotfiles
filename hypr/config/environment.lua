------------------------------
---- ENVIRONMENT VARIABLES ---
------------------------------

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Applications
hl.env("GRIMBLAST_EDITOR", "satty --filename")

-- Qt theming
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Paths
local home = os.getenv("HOME")

hl.env("PATH", home .. "/.config/hypr/scripts:" .. os.getenv("PATH"))

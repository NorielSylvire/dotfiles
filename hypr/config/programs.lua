---------------------
---- MY PROGRAMS ----
---------------------

local programs = {
    terminal    = "kitty",
    fileManager = "thunar",
    menu        = "rofi -show drun",
}

-- Expose programs globally so other modules can use them.
_G.programs = programs

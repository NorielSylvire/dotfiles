# Hyprland Keybinds

> [!info] Main Modifier
> **Super** (`⊞` / Windows key) is the main modifier for most keybinds.

---

## 🖥️ Programs

| Keybind | Action |
|---|---|
| `Super + Q` | Open terminal |
| `Super + E` | Open file manager |
| `Super + T` | Open Kitty with `kitty-floating` class |

---

## 🪟 Window Management

| Keybind     | Action              |
| ----------- | ------------------- |
| `Super + C` | Close active window |
| `Super + V` | Toggle floating     |
| `Super + P` | Toggle pseudo mode  |
| `Super + J` | Toggle split        |
| `Super + F` | Toggle fullscreen   |

### Focus

| Keybind | Action |
|---|---|
| `Super + ←` | Focus window to the left |
| `Super + →` | Focus window to the right |
| `Super + ↑` | Focus window above |
| `Super + ↓` | Focus window below |

### Mouse

| Keybind               | Action             |
| --------------------- | ------------------ |
| `Super + Left Click`  | Move / drag window |
| `Super + Right Click` | Resize window      |

---

## 🗂️ Workspaces

| Keybind                    | Action                              |
| -------------------------- | ----------------------------------- |
| `Super + 1`                | Switch to workspace 1               |
| `Super + 2`                | Switch to workspace 2               |
| `Super + 3`                | Switch to workspace 3               |
| `Super + 4`                | Switch to workspace 4               |
| `Super + 5`                | Switch to workspace 5               |
| `Super + 6`                | Switch to workspace 6               |
| `Super + 7`                | Switch to workspace 7               |
| `Super + 8`                | Switch to workspace 8               |
| `Super + 9`                | Switch to workspace 9               |
| `Super + 0`                | Switch to workspace 10              |
| `Super + Shift + 1–9`      | Move active window to workspace 1–9 |
| `Super + Shift + 0`        | Move active window to workspace 10  |
| `Super + Mouse Wheel Down` | Next workspace                      |
| `Super + Mouse Wheel Up`   | Previous workspace                  |

---

## 🧙 Scratchpad

**Scratchpad:** `special:magic`

| Keybind | Action |
|---|---|
| `Super + S` | Toggle `magic` scratchpad |
| `Super + Shift + S` | Move active window to `magic` scratchpad |

---

## 🚪 Session

| Keybind | Action |
|---|---|
| `Super + M` | Shut down using `hyprshutdown`, falling back to Hyprland shutdown |

---

## 🔊 Audio

| Keybind | Action |
|---|---|
| `Volume Up` | Increase volume by 5% |
| `Volume Down` | Decrease volume by 5% |
| `Mute` | Toggle default audio output mute |
| `Mic Mute` | Toggle default microphone mute |

> [!note]
> Audio keybinds are configured as **locked** and **repeating**, so they work while the screen is locked and repeat when held.

---

## 💡 Brightness

| Keybind | Action |
|---|---|
| `Brightness Up` | Increase brightness by 5% |
| `Brightness Down` | Decrease brightness by 5% |

> [!note]
> Brightness keybinds are also configured as **locked** and **repeating**.

---

## 🎵 Media Player

| Keybind | Action |
|---|---|
| `Next Track` | Next track via `playerctl` |
| `Play/Pause` | Play/pause via `playerctl` |
| `Previous Track` | Previous track via `playerctl` |

---

## 📸 Screenshots

Screenshots use `~/.local/bin/screenshot` and are processed through **Satty**.

| Keybind | Action |
|---|---|
| `Print` | Current monitor → Satty → save |
| `Super + Print` | Select area → Satty → save |
| `Shift + Print` | Current monitor → Satty → save + clipboard |
| `Super + Shift + Print` | Select area → Satty → save + clipboard |
| `Ctrl + Print` | Active window → Satty → save |
| `Ctrl + Shift + Print` | Active window → Satty → save + clipboard |
| `Alt + Print` | All monitors → Satty → save |
| `Alt + Shift + Print` | All monitors → Satty → save + clipboard |

---

# 🖼️ Wallpapers

## Random Wallpaper

| Keybind | Action |
|---|---|
| `Super + Shift + W` | Random wallpaper on all monitors |
| `Super + Shift + 1 + W` | Random wallpaper on `DP-1` |
| `Super + Shift + 2 + W` | Random wallpaper on `DP-2` |

## Random Static

| Keybind | Action |
|---|---|
| `Super + Ctrl + W` | Random static wallpaper on all monitors |
| `Super + Ctrl + 1 + W` | Random static wallpaper on `DP-1` |
| `Super + Ctrl + 2 + W` | Random static wallpaper on `DP-2` |

## Random Animated

| Keybind | Action |
|---|---|
| `Super + Alt + W` | Random animated wallpaper on all monitors |
| `Super + Alt + 1 + W` | Random animated wallpaper on `DP-1` |
| `Super + Alt + 2 + W` | Random animated wallpaper on `DP-2` |

## Next Wallpaper

| Keybind | Action |
|---|---|
| `Super + N` | Next wallpaper on all monitors |
| `Super + N + 1` | Next wallpaper on `DP-1` |
| `Super + N + 2` | Next wallpaper on `DP-2` |

## Waypaper

| Keybind | Action |
|---|---|
| `Super + W` | Open Waypaper |

---

# 🎥 Screen Recording

| Keybind             | Action               |
| ------------------- | -------------------- |
| `Super + Shift + R` | Record all monitors  |
| `Super + Shift + T` | Record `DP-1`        |
| `Super + Shift + Y` | Record `DP-2`        |
| `Super + Shift + A` | Record selected area |

---

# 🚀 Rofi

## Application Launcher

| Keybind | Action |
|---|---|
| `Super + D` | Rofi application launcher (`drun`) |
| `Super + R` | Rofi command runner (`run`) |

## Window Switcher

| Keybind | Action |
|---|---|
| `Super + Tab` | Rofi window switcher |

**Theme:** `~/.config/rofi/themes/windows.rasi`

---

# ⚡ Quick Reference

| Keybind               | Action                   |
| --------------------- | ------------------------ |
| `Super + Q`           | Terminal                 |
| `Super + E`           | File manager             |
| `Super + T`           | Floating Kitty           |
| `Super + D`           | Application launcher     |
| `Super + Tab`         | Window switcher          |
| `Super + C`           | Close window             |
| `Super + V`           | Toggle floating          |
| `Super + F`           | Fullscreen               |
| `Super + S`           | Scratchpad               |
| `Super + 1–0`         | Switch workspace         |
| `Super + Shift + 1–0` | Move window to workspace |
| `Super + ←/→/↑/↓`     | Focus window             |
| `Super + Mouse Wheel` | Change workspace         |
| `Super + M`           | Shutdown                 |
| `Print`               | Screenshot               |
| `Super + Shift + W`   | Random wallpaper         |
| `Super + W`           | Waypaper                 |
| `Super + Shift + R`   | Screen recording         |
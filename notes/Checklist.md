# Archcraft Hyprland Rice — Master Checklist

## 🌟 Phase 0 — Safety & Baseline Checklist

- [x] 💾 Back up the existing `~/.config/hypr/`
- [x] 🖥️ Confirm Hyprland launches through SDDM
- [x] 🌐 Confirm Wayland session works
- [x] ⌨️ Confirm keyboard and mouse work
- [x] 🖥️ Confirm monitor resolution/refresh rate
- [x] 📶 Confirm networking works
- [x] 🔧 Keep Openbox available as fallback
- [x] 📂 Establish a clean Git repository for our dotfiles


[Hyprland Phase 1 Checklist](./Hyprland/P1%20Checklist.md)

## Phase 13 — Notifications 🔔
- [x] Install and configure **Mako** for notifications
- [x] Set notification **position** on the screen
- [x] Configure **timeout** duration for notifications
- [x] Choose a **font** for notification text
- [x] Customize **colors** for notifications
- [x] Set **urgency levels** for different types of notifications
- [ ] Enable **volume notifications** for audio changes
- [x] Ensure **system notifications** are properly displayed

## Phase 14 — Locking / Idle ⏱️🔒
### Hypridle
- [x] Configure **idle timeout** ⏳
- [x] Configure **screen dimming** 🌙
- [x] Configure **screen locking** 🔒
- [x] Configure **suspend behavior** 💤

### Hyprlock
- [x] Configure **lock screen** 🔐
- [x] Set **wallpaper** 🖼️
- [x] Configure **clock** 🕒
- [x] Configure **user** information 👤
- [x] Configure **password prompt** 🔑
- [x] Configure **system information** ℹ️
- [x] Customize **styling** 🎨

## Phase 15 — Wallpaper 🖼️
- [x] Choose a wallpaper manager:
  - [ ] hyprpaper
  - [x] swww

- [x] Set up a **wallpaper directory** 📂
- [x] Configure **startup wallpaper** 🌅
- [x] Determine **multi-monitor wallpaper behavior** 🖥️🖥️
- [x] Implement **wallpaper switching** 🔄
- [x] Optional: Create a **random wallpaper script** 🎲

## Phase 16 — Theming 🎨✨
### GTK 🖌️
- [x] Choose a **GTK theme** 🎨
- [x] Select **GTK icons** 🖼️
- [x] Choose a **GTK font** 🔤
- [x] Select a **cursor theme** 🖱️
- [x] Set **dark/light preference** 🌙☀️
- [x] added a dock at the bottom with buttons to open apps

### Qt 🖥️
- [x] Choose a **Qt theme** 🎨
- [x] Select a **Qt font** 🔤
- [x] Choose **Qt icons** 🖼️

### Terminal 🖥️💻
- [x] Configure **Kitty colors** 🎨
- [x] Set **prompt colors** 💬
- [x] Configure **Neovim colors** 🎨

### Hyprland 🖥️🖌️
- [x] Configure **borders** 🖼️
- [x] Set **gaps** 📏
- [x] Configure **shadows** 🌑
- [x] Set **opacity** 🌫️
- [x] Configure **animations** 🎞️

# Phase 17 — Fonts 🎨🖋️
## Font Selection for Coding Environment
- [x] Choose a **Nerd Font** 🖋️
- [x] Select a **monospace font** 🔤
- [x] Choose a **terminal font** 💻
- [x] Select a **Neovim font** 📝
- [x] Choose a **Waybar font** 📊
- [x] Select a **UI font** 🖥️
- [x] Ensure **icon glyph support** 🔣

# Phase 18 — File Manager 🗂️
We don't necessarily need a huge graphical file manager. We'll decide whether you want:
- [x] **Thunar** 🖼️
- [ ] **PCManFM** 🗃️
- [ ] **Another lightweight GUI** 🖥️
- [ ] **Terminal file manager** 💻
- [ ] **Purely terminal-based workflow** 📝

## Phase 19 — Screenshots / Screen Recording 📸🎥
- [x] Install **grim** for screenshots 🖼️
- [x] Install **slurp** for selecting screen areas ✂️
- [x] Configure **screenshot keybindings** ⌨️
- [x] Set **screenshot save directory** 📂
- [x] Enable **clipboard screenshots** 📋
- [x] Install **screen recording tools** 🎬
- [x] Configure **optional recording UI** 🖥️

# Phase 20 — Audio / Media 🎵🎶

- [x] Install **PipeWire** 🎛️
- [x] Install **WirePlumber** 🔌
- [x] Configure **volume controls** 🔊
- [x] Set up **Waybar audio module** 🎚️
- [x] Configure **media keys** ⌨️
- [x] Optional: Set up **player controls** 🎧

# Phase 21 — Power Management ⚡🔋
- [x] Configure **power profiles** ⚡
- [x] Set up **battery indicator** 🔋
- [x] Configure **suspend behavior** 💤
- [x] Set **screen timeout** ⏳
- [x] Adjust **brightness settings** 🌞
- [x] Configure **keyboard brightness** if applicable 💡

# Phase 22 — Clipboard 📋✨
- [x] Ensure **clipboard functionality** works across all applications 🔄
- [x] Configure **Neovim clipboard integration** 📝
- [x] Set up **Kitty terminal clipboard support** 💻
- [x] Verify **Firefox clipboard operations** 🌐
- [x] Enable **Wayland clipboard support** 🖥️
- [x] Install and configure **wl-clipboard** for Wayland 🖱️
- [x] Set up **Neovim clipboard provider** for seamless copy-paste 📝
- [x] Optional: Implement **clipboard persistence/history** if desired 🕒

# Phase 23 — Security / Authentication 🔒🛡️
- [x] Configure **Polkit** for authentication and permissions 🛡️
- [x] Set up **SDDM** for secure login and session management 🖥️
- [x] Configure **keyring** for secure storage of passwords and secrets 🔑
- [x] Set up **SSH agent** for managing SSH keys securely 🗝️
- [x] Configure **sudo** for secure privilege escalation and command execution ⚡
- [x] Set up **GitHub SSH** for secure access to repositories 🌐
- [x] Avoid storing sensitive information in **dotfiles** to maintain security and privacy 📝

# Phase 24 — Dotfiles Architecture 🗂️✨
- [x] Establish a **dotfiles repository** in `~/dotfiles/` 📂
- [x] Create subdirectories for each application:
- [x] `hypr/` 🖥️
- [x] `kitty/` 💻
- [x] `waybar/` 📊
- [x] `rofi/` 🔍
- [x] `mako/` 🔔
- [x] `zsh/` 🐚
- [x] `nvim/` 📝
- [x] `git/` 🌐
- [x] `scripts/` 🛠️
- [x] Symlink or configure these directories into `~/.config/` for proper application usage 🔗
- [x] Symlink or configure individual dotfiles into home directory:
- [x] `~/.zshrc` 🐚
- [x] `~/.gitconfig` 🌐

# Phase 25 — Backup / Recovery 💾🛠️
Before we start doing serious experimentation, ensure you have a solid backup and recovery strategy in place:
- [x] **Dotfiles Git Repository** 🌐
- [x] **Hyprland Config Backup** 🖥️
- [x] **Package List** 📦
- [x] **Installed AUR Packages** if any 🛠️
- [x] **Custom Scripts** 📝
- [x] **SSH Configuration Backup Strategy** 🔑
- [x] **Recovery Procedure** 🛡️

# Phase 26 — Performance Tuning ⚡📈
- [ ] Optimize **Hyprland startup time** ⏱️
- [ ] Monitor **Waybar resource usage** 📊
- [ ] Evaluate **notification daemon performance** 🔔
- [ ] Identify and disable **unnecessary services** 🛑
- [ ] Adjust **compositor settings** for optimal performance 🎨
- [ ] Test **animation performance** 🎞️
- [ ] Assess **USB I/O considerations** for better responsiveness 🔌
- [ ] Monitor **memory usage** 🧠
- [ ] Analyze **boot time** for improvements 🚀

# Phase 27 — Final Polish ✨🔧
- [x] Ensure **consistent keybindings** across all applications ⌨️
- [x] Maintain **consistent color schemes** throughout the environment 🎨
- [x] Use **consistent fonts** for a unified look 🔤
- [x] Apply **consistent spacing** in UI elements 📏
- [x] Standardize **icons** for clarity and aesthetics 🖼️
- [x] Optimize **startup sequence** for efficiency 🚀
- [x] Refine **notification behavior** for better user experience 🔔
- [x] Perfect the **lock screen** design and functionality 🔒
- [x] Set a **wallpaper** that complements the overall theme 🖼️
- [x] Customize **Waybar** for a polished status bar 📊
- [x] Configure the **launcher** for quick access to applications 🔍
- [x] Fine-tune the **terminal** settings for usability 💻
- [x] Enhance the **shell** experience for productivity 🐚
- [x] Optimize **Neovim** configuration for coding efficiency 📝
- [x] Set up **Git** for version control and collaboration 🌐
- [x] Finalize **development toolchains** for a complete programming environment 🛠️
# ═══════════════════════════════════════════════════════════════
# ZSH — ENVIRONMENT
# ═══════════════════════════════════════════════════════════════

# User binaries
export PATH="$HOME/bin:$HOME/.config/hypr/scripts/:$HOME/.config/waybar/scripts/:$HOME/dotfiles/scripts/:$HOME/.local/share/gem/ruby/3.4.0/bin:$HOME/.tmuxifier/bin:$HOME/.local/npm/bin:$PATH"

# User C/C++ headers and libraries
export C_INCLUDE_PATH="${HOME}/include:"
export CPLUS_INCLUDE_PATH="${HOME}/include:"
export CPATH="${HOME}/include:"
export LIBRARY_PATH="${HOME}/lib:"

# Tmuxifier
export PATH="${HOME}/.tmuxifier/bin:${PATH}"

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"


# ═══════════════════════════════════════════════════════════════
# ZSH — TOOLS
# ═══════════════════════════════════════════════════════════════

# Tmuxifier
eval "$(tmuxifier init -)"

# Colorls completion
source "$(dirname "$(gem which colorls)")/tab_complete.sh"

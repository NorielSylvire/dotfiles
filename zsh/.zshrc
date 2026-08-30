# ═══════════════════════════════════════════════════════════════
# ZSH — INTERACTIVE SHELL
# ═══════════════════════════════════════════════════════════════

# ─────────────────────────────────────────
# USER CONFIGURATION
# ─────────────────────────────────────────

source "$HOME/.config/zsh/env.zsh"
source "$HOME/.config/zsh/aliases.zsh"


# ─────────────────────────────────────────
# COMPLETION
# ─────────────────────────────────────────

autoload -Uz compinit

# Store completion dump in the user's cache directory.
# This avoids cluttering $HOME with .zcompdump.
ZSH_COMPDUMP="$HOME/.cache/zsh/zcompdump"

mkdir -p "$HOME/.cache/zsh"

# Rebuild completion dump once per day.
if [[ ! -f "$ZSH_COMPDUMP" || "$ZSH_COMPDUMP" -ot "$ZSH_COMPDUMP"(#q-1) ]]; then
    compinit -d "$ZSH_COMPDUMP"
else
    compinit -C -d "$ZSH_COMPDUMP"
fi

# Completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Case-insensitive matching
zstyle ':completion:*' matcher-list \
    'm:{a-z}={A-Z}' \
    'r:|[._-]=* r:|=*'

# Colored completion listings
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Directories first
zstyle ':completion:*' list-dirs-first true

# Don't show hidden files unless explicitly requested
zstyle ':completion:*' file-patterns \
    '%p:globbed-files' \
    '*(D-/):directories'

# Completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$HOME/.cache/zsh"


# ─────────────────────────────────────────
# HISTORY SUBSTRING SEARCH
# ─────────────────────────────────────────

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh


# ─────────────────────────────────────────
# COMPLETION KEYBINDINGS
# ─────────────────────────────────────────

# Tab — complete
bindkey '^I' expand-or-complete

# Shift+Tab — previous completion
bindkey '^[[Z' reverse-menu-complete


# ─────────────────────────────────────────
# FZF — FUZZY FINDER
# ─────────────────────────────────────────

# Zsh completion
source /usr/share/fzf/completion.zsh

# Zsh keybindings
source /usr/share/fzf/key-bindings.zsh


# ─────────────────────────────────────────
# BAT — SYNTAX HIGHLIGHTING FOR CAT
# ─────────────────────────────────────────

export BAT_THEME="Cyberpunk Red"


# ─────────────────────────────────────────
# HISTORY SEARCH
# ─────────────────────────────────────────

# Up / Down — search history using the text already typed.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Also support application cursor mode used by some terminals.
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down


# ─────────────────────────────────────────
# DIRECTORY NAVIGATION
# ─────────────────────────────────────────

# Automatically change directory when a directory is entered by name.
setopt AUTO_CD

# Make directory navigation more forgiving.
setopt CDABLE_VARS

# `cd` with no argument goes to $HOME.
# (This is already Zsh's default, but kept explicit.)

# Directory stack.
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# `cd -` and directory stack navigation.
setopt PUSHD_TO_HOME

# Keep a useful directory stack.
DIRSTACKSIZE=20


# ─────────────────────────────────────────
# HISTORY
# ─────────────────────────────────────────

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY


# ─────────────────────────────────────────
# ZOXIDE
# ─────────────────────────────────────────

# Smarter directory jumping.
eval "$(zoxide init zsh)"


# ─────────────────────────────────────────
# AUTOSUGGESTIONS
# ─────────────────────────────────────────

# Load zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Suggestions are generated primarily from previous commands.
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Muted gray so suggestions don't compete with typed text.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#55555d'


# ─────────────────────────────────────────
# SYNTAX HIGHLIGHTING
# ─────────────────────────────────────────

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Dark-red cyberpunk palette
typeset -gA ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]='fg=#e8e8ec'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#ff1a1a'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#d40000'
ZSH_HIGHLIGHT_STYLES[function]='fg=#d40000'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#720000'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#ff1a1a'
ZSH_HIGHLIGHT_STYLES[path]='fg=#b8b8c0'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#ff1a1a'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff0000,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#d40000,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#55555d'


# ─────────────────────────────────────────
# COMMAND HASH / REHASH
# ─────────────────────────────────────────

# Refresh the command hash when pacman's command cache changes.

zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
    if [[ -f /var/cache/zsh/pacman ]]; then
        local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"

        if (( zshcache_time < paccache_time )); then
            rehash
            zshcache_time="$paccache_time"
        fi
    fi
}

add-zsh-hook precmd rehash_precmd


# ─────────────────────────────────────────
# STARSHIP PROMPT
# ─────────────────────────────────────────

eval "$(starship init zsh)"


if [[ -o interactive ]]; then
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        onefetch
    else
        neofetch
    fi
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


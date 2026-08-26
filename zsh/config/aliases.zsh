# Git
alias gst="onefetch; git status"
alias ga="git add"
alias gall="git add *"
alias "ga*"="git add *"
alias nah="git clean -df && git checkout -- ."
alias gcl="git clone"
alias gl="git log"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp="git push"
alias gc="git commit -m"
alias gck="git checkout"
alias gf="git fetch"
alias gpl="git pull"
alias grb="git rebase"
alias gam="git commit --amend --no-edit"

# Git extras
alias gpb="git playback -t tomorrow-night-eighties"

# Misc
alias rf="rm -rf"
alias tm=tmux
alias tx=tmuxifier
alias preview="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias francinette=~/francinette/tester.sh
alias paco=~/francinette/tester.sh
alias norm=~/repos/scripts/norm.sh
alias normx=~/repos/scripts/normx.sh
alias spmeter=~/repos/scripts/spmeter.sh
alias vim="nvim +\"NvimTreeToggle\" -c \"wincmd w\""
alias vimdiff="nvim -d"
alias t=todo.sh
alias lol="fortune | cowsay | lolcat"

# List
alias ls="colorls"
alias l=ls
alias L="ls -l"
alias la="ls -a"
alias ll="ls -la"
alias lr="/bin/ls -lRa"
alias lf="/bin/ls -F"

# Clear
alias c="clear"
alias cl="clear"
alias ckear="clear"
alias clr="clear"

# Cd
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
alias -- -='cd -'

# History
alias h="history"
alias h1="history 10"
alias h2="history 20"
alias h3="history 30"
alias hgrep='history | grep'

# Exit
alias :q="exit"
alias ext="exit"
alias xt="exit"
alias by="exit"
alias bye="exit"
alias die="exit"
alias quit="exit"

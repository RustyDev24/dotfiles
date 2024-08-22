# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "devadathanmb/zap-robbyrussell"

# Load and initialise completion system
autoload -Uz compinit
compinit

neofetch

export PATH=$PATH:$HOME/.config/scripts:$HOME/go/bin

# git aliases
alias gco="git checkout"
alias gap="git add -p"
alias gcm="git commit -m"
alias gb="git branch"
alias gs="git status"
alias gsp="git stash pop"
alias hangon="git stash -u"

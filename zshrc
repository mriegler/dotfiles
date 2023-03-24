# -*- mode: conf-*-

# run first time setup
if [ ! -f ~/.SETUP_DONE ]; then
    ~/dotfiles/setup.sh
fi

# Set up check for running on Windows/WSL
if [[ $(uname -r) =~ Microsoft$ ]]; then
    isWindows=true
fi

# setup zgenom, simple plugin manager
source ~/.dotfiles/zgenom/zgenom.zsh

# update every 7 days
zgenom autoupdate

if ! zgenom saved; then
    zgenom load marlonrichert/zsh-autocomplete
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom ohmyzsh plugins/vi-mode

    zgenom save
fi

# Modify History
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000

# PATH Adjustments
# Android SDK
export PATH=/Users/marcel/Library/Android/sdk/tools:$PATH
export PATH=/Users/marcel/Library/Android/sdk/platform-tools:$PATH
export ANDROID_HOME=/Users/marcel/Library/Android/sdk

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Aliases
alias ll='ls -alhG'
alias emacs='open -a /Applications/Emacs.app $1'
alias g=git

# Settings
export ALTERNATE_EDITOR=""
export EDITOR="vim"
export VISUAL="vim"
export LANG=en_US.UTF-8
export REBEL_HOME="/Users/marcel.riegler/Downloads/jrebel"

# Start Zsh  theme/prompt starship
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

# add homebrew autocompletions
if type brew &>/dev/null
then
      FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
      autoload -Uz compinit
      compinit
fi

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

VI_MODE_SET_CURSOR=true

# enable rtx
eval "$(rtx activate -s zsh)"

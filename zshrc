# -*- mode: conf-*-

########
# Helpers
########
function ensure() {
    local com=$1
    local program=$com
    if [[ $# == 2 ]]; then
        local program=$2
    fi
    if ! type $com &>/dev/null; then
        install $program
    fi
}

function install() {
    local program=$1
    if type brew &>/dev/null; then
        brew install $program
    elif type apt &>/dev/null; then
        apt install -y $program
    else
        echo "install $program by hand"
    fi
}

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


# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
# MacPorts Installer addition on 2015-11-16_at_13:00:39: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Air SDK custom bin location
export PATH="/Library/AirSDK/bin:$PATH"

# Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

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
ensure starship
eval "$(starship init zsh)"

# Setup Zoxide, for fast directory switching
ensure zoxide
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

# add asdf shims
if [[ -f /usr/local/opt/asdf/libexec/asdf.sh ]];
then
    source /usr/local/opt/asdf/libexec.asdf.sh
elif [[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]];
then
    source /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

# add asdf java_home automatically
. ~/.asdf/plugins/java/set-java-home.zsh


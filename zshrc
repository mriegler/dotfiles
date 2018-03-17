# -*- mode: conf-*-

# Set up check for running on Windows/WSL
if [[ $(uname -r) =~ Microsoft$ ]]; then
    isWindows=true
fi

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Modify History
SHARE_HISTORY="true"
EXTENDED_HISTORY="true"
HIST_IGNORE_DUPS="true"
HIST_IGNORE_ALL_DUPS="true"
HIST_REDUCE_BLANKS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(colored-man-pages \
    vagrant \
    z \
    vi-mode \
    emacs \
    npm \
    docker \
    pip \
    python \
    brew \
    osx \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    history-substring-search \
    vi-mode)
# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# PATH Adjustments
# Android SDK
export PATH=/Users/marcel/Library/Android/sdk/tools:$PATH
export PATH=/Users/marcel/Library/Android/sdk/platform-tools:$PATH
export ANDROID_HOME=/Users/marcel/Library/Android/sdk
# MacPorts Installer addition on 2015-11-16_at_13:00:39: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Air SDK custom bin location
export PATH="/Library/AirSDK/bin:$PATH"
# Java home and bin
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$JAVA_HOME/bin:$PATH
# Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# Aliases
alias ll='ls -alhG'
alias emacs='open -a /Applications/Emacs.app $1'
alias g=git

# Settings
export ALTERNATE_EDITOR=""
export EDITOR="vi"
export LANG=en_US.UTF-8

# Oh my ZSH
# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Use a prompt without git on WSL, because git is super slow
if [[ "$isWindows" = true ]]; then
    ZSH_THEME="xiong-chiamiov"
else
    ZSH_THEME="avit"
fi

# start oh my zsh
source $ZSH/oh-my-zsh.sh

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

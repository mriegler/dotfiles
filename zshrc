# -*- mode: conf-*-
# Path to your oh-my-zsh installation.
export ZSH=/Users/marcel/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fishy"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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
plugins=(git colored-man colorize github vagrant z emacs npm docker virtualenv pip python \
    brew osx zsh-syntax-highlighting zsh-autosuggestions history-substring-search tmuxinator)
# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
# User configuration

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

alias ll='ls -alhG'

# Make GUI Emacs usable from cli
alias emacs='open -a /Applications/Emacs.app $1'
export ALTERNATE_EDITOR=""
export EDITOR="emacs"

# Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

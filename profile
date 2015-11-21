# PATH Adjustments

# Android SDK
export PATH=/Users/marcel/Library/Android/sdk/tools:$PATH
export PATH=/Users/marcel/Library/Android/sdk/platform-tools:$PATH

# MacPorts Installer addition on 2015-11-16_at_13:00:39: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# Spacemacs emacs PATH addition
export PATH=/opt/homebrew-cask/Caskroom/emacs/24.5-1/Emacs.app/Contents/MacOS/bin:$PATH

alias ll='ls -alh --colors always'

# Make GUI Emacs usable from cli
alias emacs='open -a /Applications/Emacs.app $1'
export ALTERNATE_EDITOR=""
export EDITOR="emacs"


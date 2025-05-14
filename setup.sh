#! /bin/bash

set -e

echo "Setting up system"

if ! command -v brew &> /dev/null; then
    echo "Installing brew"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# at the very first setup, brew isn't in the path after install, so find it
if command -v "brew" &> /dev/null; then
    BREW_COMMAND="brew"
elif [[ -d "/home/linuxbrew" ]]; then
    BREW_COMMAND="/home/linuxbrew/.linuxbrew/bin/brew"
elif [[ -d "/opt/homebrew" ]]; then
    BREW_COMMAND="/opt/homebrew/bin/brew"
fi

cd

echo "Installing Brew dependencies from Brewfile"
$BREW_COMMAND bundle


# set zsh as login shell
if command -v "zsh" &> /dev/null \
    && ! [[ "$SHELL" == *"zsh" ]]; then
    if ! grep -q "$(which zsh)" /etc/shells; then 
	echo "adding zsh to allowed login shells"
        echo "$(which zsh)" | sudo tee -a /etc/shells > /dev/null
    fi
    echo "updating login shell"
    chsh -s "$(which zsh)"
fi

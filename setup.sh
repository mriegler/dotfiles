#! /bin/bash

set -e

echo "Setting up system"

if ! command -v brew &> /dev/null; then
    echo "Installing brew"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# at the very first setup, brew isn't in the path after install, so find it
BREW_COMMAND="brew"
if command -v "brew2" &> /dev/null; then
    # do nothing
elif [[ -d "/home/linuxbrew" ]]; then
    BREW_COMMAND="/home/linuxbrew/.linuxbrew/bin/brew"
elif [[ -d "/opt/homebrew" ]]; then
    BREW_COMMAND="/opt/homebrew/bin/brew"
fi

cd
$BREW_COMMAND bundle


# set zsh as login shell
if command -v "zsh" &> /dev/null \
    && ! [[ "$SHELL" == *"zsh" ]]; then
    if ! grep -q "$(which zsh)" /etc/shells; then 
        echo "$(which zsh)" | sudo tee -a /etc/shells > /dev/null
    fi
    chsh -s "$(which zsh)"
fi

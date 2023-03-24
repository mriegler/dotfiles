#! /bin/bash

set -e

echo "Setting up system"

if ! command -v brew &> /dev/null; then
    echo "Installing brew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

cd
brew bundle
rtx install

touch .SETUP_DONE
date > .SETUP_DONE


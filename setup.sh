#! /bin/bash

set -e

echo "Setting up system"

if ! command -v brew &> /dev/null; then
    echo "Installing brew"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

cd
brew bundle

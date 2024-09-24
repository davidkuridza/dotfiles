#!/bin/sh

set -e
set -u

####################################################################################################
## functions

header() { #message
    printf "\033[1;37m=> %s\033[0m" "${1}"
}

####################################################################################################
## main

cd "$(dirname "${0}")"

# install
xcode-select --install || true

# dependencies
header "Install dependencies"

# homebrew
if ! test "$(which brew)"; then
    header "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# oh-my-zsh
if ! test -d ~/.oh-my-zsh; then
    header "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# configure everything else :)
./bin/dotfiles --all

# and done :)
header "Done."
echo "Take the next step with 'dotfiles --help' :)"

#!/bin/sh

set -e
set -u

####################################################################################################
## functions

header() { #message
    echo "\033[1;37m=> ${1}\033[0m"
}

####################################################################################################
## main

# oh-my-zsh
if ! test -d ~/.oh-my-zsh; then
    header "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# homebrew
if ! test "$(which brew)"; then
    header "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# main configuration
./bin/dotfiles --dots

# and done :)
header "Done."
echo "Take the next step with 'dotfiles --help' :)"

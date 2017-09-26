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

cd "$(dirname "${0}")"

# install
xcode-select --install || true

# install dependencies and dotfiles
./bin/dotfiles --deps --dots

# and done :)
header "Done."
echo "Take the next step with 'dotfiles --help' :)"

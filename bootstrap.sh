#!/bin/sh

set -e
set -u

####################################################################################################
## functions

header() { #message
    printf "\033[1;37m=> %s\033[0m" "${1}"
}

symlink() { # source destination
    src="${1}"
    dst="${2}"
    echo "Symlinking \033[0;33m${src}\033[0m to \033[0;33m${dst}\033[0m"
    ln -sf "$(pwd)/${src}" "${dst}"
}

makedir() { # destination
    dst="${1}"
    echo "Creating \033[0;33m${dst}\033[0m"
    mkdir -p "${dst}"
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

# configuration
header "Preparing configuration"
find dots custom/dots -maxdepth 1 -name '.*' -not -name '.DS_Store' -not -name '.' 2>/dev/null | while read -r src; do
    src=$(echo $src | sed 's/^.\///')
    test -f "${src}" && target="${HOME}/$(basename "${src}")" || target="${HOME}"
    symlink "${src}" "${target}"
done

# homebrew
header "Installing Homebrew packages"
find . custom -maxdepth 1 -type f -name Brewfile -exec cat {} \; | xargs /opt/homebrew/bin/brew install

header "Installing Homebrew Cask packages"
find . custom -maxdepth 1 -type f -name Caskfile -exec cat {} \; | xargs /opt/homebrew/bin/brew install --cask

# fzf
header "Installing fzf bindings"
/opt/homebrew/opt/fzf/install --key-bindings --completion --no-update-rc

# macos
source ./macos.sh

# custom script
test -f ./custom/provision.sh && source ./custom/provision.sh

# and done :)
header "Done."

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

ZSH_THEME="refined"

plugins=(docker git tig)

source $ZSH/oh-my-zsh.sh

# load the shell dotfiles
for file in ~/.{alias,alias.local,exports,exports.local}; do
    [ -r "${file}" ] && [ -f "${file}" ] && source "${file}";
done;
unset file;

# In order for gpg to find gpg-agent, gpg-agent must be running,
# and there must be an env variable pointing GPG to the gpg-agent socket.
if [ -S ~/.gnupg/S.gpg-agent ] && [ -n "$(pgrep gpg-agent)" ]; then
    export GPG_AGENT_INFO=~/.gnupg/S.gpg-agent
else
    eval $(gpg-agent --daemon)
fi

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# direnv
eval "$(direnv hook zsh)"

# mise-on-place
eval "$(mise activate zsh)"

# taskfile
eval "$(task --completion zsh)"

# autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

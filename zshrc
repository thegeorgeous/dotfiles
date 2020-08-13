# Path to your oh-my-zsh installation.
export ZSH=/Users/george/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler rails docker kubectl mvn spring)

source $ZSH/oh-my-zsh.sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

#. `brew --prefix`/etc/profile.d/z.sh
export GPG_TTY=$(tty)
export TERM=xterm-256color
alias reload="source ~/.zshrc"
alias ec="emacsclient -n"
alias bubu="brew update && brew upgrade && brew outdated && brew cleanup"
alias sml="rlwrap sml"

# path for ctags
export PATH="/usr/local/bin:$PATH"

# path for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="/usr/local/sbin:$PATH"
export PATH="/Users/george/.emacs.d/bin:$PATH"
export PATH="/Users/george/go/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

git_maintain() {
    git stash
    git checkout master
    git fetch -p
    git pull
}
unsetopt nomatch
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# opam configuration
test -r /Users/george/.opam/opam-init/init.zsh && . /Users/george/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"

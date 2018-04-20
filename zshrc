# Path to your oh-my-zsh installation.
export ZSH=/Users/thegeorgeous/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler rails brew)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

. `brew --prefix`/etc/profile.d/z.sh

export TERM=xterm-256color
alias let_there_be_light="~/Applications/led-backlight-cmstorm"
alias reload="source ~/.zshrc"
alias ec="emacsclient -n"

export PATH="$HOME/.bin:$PATH"

# path for ctags
export PATH="/usr/local/bin:$PATH"

# path for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

codeclimate() {
docker run \
  --interactive --tty --rm \
  --env CODECLIMATE_CODE="$PWD" \
  --volume "$PWD":/code \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /tmp/cc:/tmp/cc \
  codeclimate/codeclimate $1 $2 $3
}

export GOPATH=$HOME/src/btt/go

export PATH="/usr/local/sbin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.5/bin:$PATH"

git_maintain() {
    git stash
    gcm
    git fetch -p
    git pull
    git gc --prune
}

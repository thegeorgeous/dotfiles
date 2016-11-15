# Path to your oh-my-zsh installation.
export ZSH=/Users/thegeorgeous/.oh-my-zsh

ZSH_THEME="agnoster"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
. `brew --prefix`/etc/profile.d/z.sh

export TERM=xterm-256color
alias let_there_be_light="~/Applications/led-backlight-cmstorm"
alias reload="source ~/.zshrc"
alias ec="emacsclient -n"

# path for ctags
export PATH="/usr/local/bin:$PATH"

# path for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


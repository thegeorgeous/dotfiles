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
alias reinstall_emacs="brew uninstall emacs && brew install emacs --HEAD --with-cocoa"
alias blog_up="docker run -v /Users/thegeorgeous/projects/thegeorgeous.github.io:/app --rm -p 80:80 thegeorgeous/blog jekyll serve --host 0.0.0.0 --port 80"

# path for ctags
export PATH="/usr/local/bin:$PATH"

# path for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


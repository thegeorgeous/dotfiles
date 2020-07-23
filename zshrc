# Path to your oh-my-zsh installation.
export ZSH=/Users/thegeorgeous/.oh-my-zsh

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

git_maintain() {
    git stash
    git checkout master
    git fetch -p
    git pull
}
unsetopt nomatch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.cargo/bin:$PATH"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/thegeorgeous/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PATH="/usr/local/opt/node@12/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export MAVEN_CLI_OPTS="-s.m2/settings.xml"
export MAVEN_REPO_USER=squareshift-dev
export MAVEN_REPO_PASS=squareshift123
export PATH="/usr/local/smlnj/bin:$PATH"
export PATH="$HOME/apache-maven-3.6.3/bin:$PATH"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home"
export PATH="/usr/local/opt/postgresql@11/bin:/usr/local/opt/node@12/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"

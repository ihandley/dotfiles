# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export JENV_ROOT="/opt/homebrew/bin/"
export PGDATA="/var/lib/pgsql/data"

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

############### Environment Variables ################

# Open SSL
export OPENSSL_CONF=/System/Library/OpenSSL/openssl.cnf	
# Ruby
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export GEM_HOME="$HOME/.gem"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

############### Paths ###################

# Local env
PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
# AWS env
PATH=$HOME/usr/local/Cellar/awscli/2.4.5/aws-cli:$PATH
# Git
PATH=/opt/homebrew/bin/git:$PATH
# Java env
PATH=$HOME/.jenv/bin:$PATH
#PATH=/usr/local/bin/node:$PATH
# Python
PATH=$HOME/Library/Python/3.8/bin:$PATH
# Splunk env
PATH=$HOME/dev/splunk/bin:$PATH
# Mule env
PATH=$MULE_HOME/bin:$PATH
# RabbitMQ env
PATH=/usr/local/opt/rabbitmq/sbin:$PATH
# Yarn env
PATH=$HOME/.yarn/bin:$PATH
PATH=$HOME/.config/yarn/global/node_modules/.bin:$PATH
# Docker env
PATH=usr/local/bin/docker:$PATH
# Ruby gem support
PATH=$(ruby -e 'puts Gem.bindir'):$PATH

############### Aliases ###################

# AWS
alias awslogin='f(){
	if [ -z "$1" ]; then echo "Env required"; fi
	zsh ~/code/src/scripts/aws-login $1;
	unset -f f; 
}; f'
# alias sso-dev='aws sso login --profile nse-dev; ssocred nse-dev'
# alias set-codeartifact='export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain nextgen --domain-owner 140547422257 --query authorizationToken --output text --profile nse-dev`'

# Chrome
# alias chrome="open -a Google\ Chrome.app $1"

# Docker
#alias docker="lima nerdctl"

# General
alias c="clear"
alias cp="cp -i"
alias h="cd ~"
alias l="colorls -lA --sd"
alias ln="ln -i"
alias mv="mv -i"
alias path="echo -e ${PATH//:/\\n}"
alias scripts="cd ~/code/src/scripts"

# Git
alias gitra="git rm -rf --cached . && git add ."
alias prune-branches="git pull; git remote prune origin"

# Micro
alias m="micro"
alias mh="micro ~/.hyper.js"
alias mo="micro ~/.oh-my-zsh"
alias mz="micro ~/.zshrc"

# Networking
alias fastping='ping -c 100 -s.2' # Do not wait interval 1 second, go fast
alias ping='ping -c 5' # Stop after sending count ECHO_REQUEST packets
alias ports='netstat -tulanp'

# Permissions
#alias chgrp="chgrp --preserve-root"
#alias chmod="chmod --preserve-root"
#alias chown="chown --preserve-root"

# Python
# alias python="python3"

# RocketMQ
# alias mqadmin="docker exec -i -w /home/rocketmq/rocketmq-4.5.0/bin rmqnamesrv ./mqadmin"

# SSH
# alias rmq="ssh ec2-user@10.238.236.222"

export PATH

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='micro'


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set up colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# Allows setting shell source using "."
function _accept-line() {
    if [[ $BUFFER == "." ]]; then
        BUFFER="source ~/.zshrc"
    fi
    zle .accept-line
} 
zle -N accept-line _accept-line

# Init pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/opt/gitstatus/gitstatus.prompt.zsh

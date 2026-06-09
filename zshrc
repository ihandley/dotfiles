export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Fafacxdxbxegedabagacad

# Prompt colors
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

# Prompt with full path and git branch
precmd() {
  local branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')
  PS1="${YELLOW}%~${GREEN}${branch}${RESET} "$'\n'"$ "
}

# History
HISTSIZE=5000
SAVEHIST=10000
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS

# Better history search with arrows
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

export VISUAL="vim"
export EDITOR="vim"
export SRC_DIR=$HOME/src

# Homebrew
brew_path="/opt/homebrew/bin"
PATH="${brew_path}:$HOME/bin:$HOME/.docker/bin:$PATH"

# Direnv (skip if not installed)
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Ripgrep config (only if file exists)
[[ -f $HOME/.ripgreprc ]] && export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# Lazy-load Go
load_go() {
  if ! command -v go &> /dev/null; then
    unset -f go
    return
  fi
  export GOPATH=${SRC_DIR}/go
  export GOROOT="$(brew --prefix golang 2>/dev/null)/libexec"
  export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
  unset -f go
}

# Lazy-load Java
load_java() {
  if ! command -v java &> /dev/null; then
    unset -f java
    return
  fi
  export PATH="$JAVA_HOME/bin:$PATH"
  unset -f java
}

# OpenCode
export OPENCODE_CONFIG_DIR="$HOME/code/github/opencode"
export OPENCODE_CONFIG="${OPENCODE_CONFIG_DIR}/opencode.json"
export JOB_COACH_DB="${HOME}/.local/share/opencode/job-coach/jobs.db"

# Aliases
alias l="eza --icons -la"
alias tree="eza --tree"
alias gitra="git rm -rf --cached . && git add ."
alias tf="terraform"
alias c='noglob code --'

# Custom functions
function quit {
  if [[ -z "$1" ]]; then
    echo "Usage: quit appname"
  else
    for appname in $1; do
      osascript -e "quit app \"$appname\""
    done
  fi
}

# Manconomy GitHub token (stored in macOS Keychain)

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Completion system
fpath=(/opt/homebrew/share/zsh-completions $fpath)

autoload -Uz compinit

if [[ -n "$(compaudit 2>/dev/null)" ]]; then
  compaudit | xargs chmod g-w,o-w
fi

compinit

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"
export FZF_CTRL_R_OPTS="--sort --exact"

# Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# Syntax highlighting must stay last
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

get_github_token() {
  security find-generic-password \
    -a "$USER" \
    -s "github-manconomy-token" \
    -w 2>/dev/null
}


# pnpm
export PNPM_HOME="/Users/ianhandley/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

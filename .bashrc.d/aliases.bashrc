# general
alias c="reset"
alias cp="cp -i"
alias h="cd ~"
alias l="ls -la"
alias ln="ln -i"
alias mv="mv -i"
alias path="echo -e ${PATH//:/\\n}"
alias apt="sudo apt"

# Git
alias gitra="git rm -rf --cached . && git add ."
alias prune-branches="git pull; git remote prune origin"

# Kubernetes
alias k="kubectl"

# Micro
alias m="micro"
alias ma="micro ~/.bashrc.d/src/aliases.bashrc"
alias mb="micro ~/.bashrcr"

# Networking
alias fastping='ping -c 100 -s.2' # Do not wait interval 1 second, go fast
alias ping='ping -c 5' # Stop after sending count ECHO_REQUEST packets
alias ports='netstat -tulanp'

# Permissions
#alias chgrp="chgrp --preserve-root"
#alias chmod="chmod --preserve-root"
#alias chown="chown --preserve-root"

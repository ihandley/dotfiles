# aliases

# utils
alias c='clear'
alias bc='bc -l'
alias free='free -mt'
alias df='df -H'
alias du='du -ch'
alias sha='shasum -a 256'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias hw='hwinfo --short'
alias cpuinfo='lscpu'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias update-fc='sudo fc-cache -fv'
alias microcode='cat /proc/cpuinfo | grep bugs'
alias microcode-big='grep . /sys/devices/system/cpu/vulnerabilities/*'
alias big='expac -H M '%m\t%n' | sort -h | nl'
alias probe='sudo -E hw-probe -all -upload'

# git
alias gac='git add .; git commit -m'
alias gpo='git push origin'
alias gitra="git rm -rf --cached . && git add ."
alias prune-branches="git pull; git remote prune origin"

# docker
# Start the docker-compose stack in the current directory
alias dcu="docker-compose up -d"

# Start the docker-compose stack in the current directory and rebuild the images
alias dcub="docker-compose up -d --build"

# Stop, delete (down) or restart the docker-compose stack in the current directory
alias dcs="docker-compose stop"
alias dcd="docker-compose down"
alias dcr="docker-compose restart"

# Show the logs for the docker-compose stack in the current directory
# May be extended with the service name to get service-specific logs, like
# 'dcl php' to get the logs of the php container
alias dcl="docker-compose logs"

# Quickly run the docker exec command like this: 'dex container-name bash'
alias dex="docker exec -it"

# 'docker ps' displays the currently running containers
alias dps="docker ps"

# This command is a neat shell pipeline to stop all running containers no matter
# where you are and without knowing any container names
alias dsa="docker ps -q | awk '{print $1}' | xargs -o docker stop"

# kubernetes
alias k="kubectl"

# networking
alias ports='netstat -tulanp'
alias header='curl -I'
alias headerc='curl -I --compress'
alias ping='ping -c 5'
alias wget='wget -c'

# gpg
alias gibson="gpg --encrypt --sign --armor"
alias ungibson="gpg --decrypt"

# file operations
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias l="colorls -lA --sd"
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# power
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

# colors & cosmetics
alias pacman='pacman --color=auto'
alias fd='fd --color auto'
alias rg='rg --color auto'
alias mount='mount | column -t'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias lah='ls -lah --color=auto'
alias lrah='ls -Rlah --color=auto'
#alias l='ls -CF --color=auto'
alias diff='colordiff'
alias pactree='pactree -c'


# micro
alias m="/opt/homebrew/bin/micro"
alias ma="m ~/.zshrc.d/src/aliases.zshrc"
alias mz="m ~/.zshrc"

alias micro="~/go/bin/micro"

# extractor for all kinds of archives
# usage: extr <file>
extr ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via extr()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

kube_prompt() {
   kubectl_current_context=$(kubectl config current-context)
   kubectl_project=$(echo $kubectl_current_context | cut -d '_' -f 2)
   kubectl_cluster=$(echo $kubectl_current_context | cut -d '_' -f 4)
   kubectl_prompt="k8s:($kubectl_project|$kubectl_cluster)"
   echo $kubectl_prompt
}

function parse_k8s_context() {
	kubectl config use-context "${1}"
}

function use_k8s-context() {
	kubectl config use-context "$%{1}"
}

# Custom functions
mg () { mkdir "$@" && cd "$@" || exit; }
cdl() { cd "$@" && ll; }
npm-latest() { npm info "$1" | grep latest; }
killport() { lsof -i tcp:"$*" | awk 'NR!=1 {print $2}' | xargs kill -9 ;}
function quit () {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: quit appname"
  else
    for appname in $1; do
    osascript -e 'quit app "'$appname'"'
    done
  fi
}
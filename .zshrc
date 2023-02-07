# zsh
source ~/.oh-my-zsh/oh-my-zsh.sh
ZSH_THEME="powerlevel10k/powerlevel10k"
CASE_SENSITIVE="true"
plugins=(git kubectl kube-ps1)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

source <(kubectl completion zsh)
function parse_k8s_context() {
	kubectl config use-context "${1}"
}

function use_k8s-context() {
	kubectl config use-context "$%{1}"
}


for file in ~/.zshrc.d/**/*.zshrc
do
  source "$file"
done

[[ -s "/Users/ianhandley/.gvm/scripts/gvm" ]] && source "/Users/ianhandley/.gvm/scripts/gvm"

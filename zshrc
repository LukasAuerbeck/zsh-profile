export ZSH=/Users/lukas/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geoffgarside"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(
	docker
  kubectl
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

export ARCHFLAGS="-arch x86_64"

bindkey "[C" forward-word
bindkey "[D" backward-word

autoload -U compinit && compinit

filesToSource=( $(find ~/.zshd -type f | grep -v '.git\|.swp\|zshrc') )

for file in "${filesToSource[@]}"; do
	source "${file}"
	local aliasName="$(echo "$(basename "${file}")")"
	alias "${aliasName}=vim $file"
done

source /usr/local/bin/google-cloud-sdk/completion.zsh.inc
source /usr/local/bin/google-cloud-sdk/path.zsh.inc
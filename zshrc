export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="aalin"

plugins=(git rails brew vagrant)

source $ZSH/oh-my-zsh.sh

# For some reason I have to do compinit here, to get completion to work with cp.
compinit

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history
setopt inc_append_history

bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char
bindkey '^[[D' backward-char

source /usr/local/Cellar/coreutils/8.12/aliases
source ~/.aliases

[[ -s "/Users/andreas/.rvm/scripts/rvm" ]] && source "/Users/andreas/.rvm/scripts/rvm"  # This loads RVM into a shell session.

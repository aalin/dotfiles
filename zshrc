export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="aalin"

plugins=(git rails brew git-escape-magic bundler pow zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# For some reason I have to do compinit here, to get completion to work with cp.
compinit

export LC_ALL=en_US.UTF-8

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history

unsetopt extendedglob # So that I can do "git reset --soft HEAD^" without getting "zsh: no matches found: HEAD^"
unsetopt share_history

eval $(dircolors ~/.dircolors)

# Use LS_COLORS when completing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' select-prompt '%SCurrent selection at %p%s'

setopt NO_NOMATCH

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

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH

export EDITOR=/usr/local/bin/vim

bindkey "[D" backward-word
bindkey "[C" forward-word

which brew > /dev/null && PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -s "$HOME/.pr0n" ]] && source "$HOME/.pr0n" # secret aliases :D
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

export OCD_PATH=~/Projects/ocd
source "$OCD_PATH/bin/ocd.zsh"

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

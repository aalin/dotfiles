export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="aalin"
export ZSH_DISABLE_COMPFIX=true

plugins=(git rails brew git-escape-magic bundler)

source $ZSH/oh-my-zsh.sh

compinit

export LC_ALL=en_US.UTF-8

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zsh_history

unsetopt extendedglob # So that I can do "git reset --soft HEAD^" without getting "zsh: no matches found: HEAD^"
unsetopt share_history

if type brew &> /dev/null ; then
  export PATH="/usr/local/opt/bison/bin:$PATH"
  export PATH="/usr/local/opt/llvm/bin:$PATH"
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
fi

if type dircolors &> /dev/null ; then
  eval $(dircolors ~/.dircolors)
fi

export GOPATH=$HOME/go

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
bindkey "[D" backward-word
bindkey "[C" forward-word

export PATH=$HOME/bin:$PATH
export PATH=/usr/local/bin:$PATH

if [[ -f /usr/local/bin/vim ]]; then
  export EDITOR=/usr/local/bin/vim
else
  export EDITOR=vim
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -s "$HOME/.aliases.local" ]] && source "$HOME/.aliases.local"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"

if [[ -z "${DEVBOX}" ]]; then
  export NVM_DIR="/Users/andreas/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
end

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export FZF_DEFAULT_COMMAND='fd --type f'

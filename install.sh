#!/bin/bash

set -e

ROOT=$(dirname "$(readlink -f "$0")")

function install() {
  local source="$ROOT/$1"
  local target=$2

  if [[ ! -a "$source" ]]; then
    echo -e "$source does not exist!"
    return 1
  fi

  if [[ -a "$target" ]]; then
    echo -e "$target already exists, skipping"
    return 0
  fi

  local targetDir
  targetDir=$(dirname "$target")

  if [[ ! -d "$targetDir" ]]; then
    echo "Creating $targetDir"
    mkdir -p "$targetDir"
  fi

  echo "Creating symlink from ${target} to ${source}"
  ln -s "$source" "$target"
}

install vimrc           ~/.vimrc
install vim/config      ~/.vim/config
install vim/ftplugin    ~/.vim/ftplugin
install gitconfig       ~/.gitconfig
install gitignore       ~/.gitignore
install aliases         ~/.aliases
install zshrc           ~/.zshrc
install dircolors       ~/.dircolors
install tmux.conf       ~/.tmux.conf
install pryrc           ~/.pryrc
install aalin.zsh-theme ~/.oh-my-zsh/themes/aalin.zsh-theme
install alacritty.yml   ~/.config/alacritty/alacritty.yml

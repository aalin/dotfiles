#!/bin/bash

set -e

if command -v greadlink > /dev/null; then
  function readlink() {
    greadlink $*
  }
fi

ROOT=$(dirname "$(readlink -f "$0")")

function success {
  echo -e "\x1b[32m$*\x1b[0m"
}

function warn {
  echo -e "\x1b[33m$*\x1b[0m"
}

function error {
  echo -e "\x1b[31m$*\x1b[0m"
}

function install {
  local source="$ROOT/$1"
  local target=$2

  if [[ ! -a "$source" ]]; then
    error "$source does not exist!"
    return 1
  fi

  if [[ -a "$target" ]]; then
    warn "$target already exists, skipping"
    return 0
  fi

  local targetDir
  targetDir=$(dirname "$target")

  if [[ ! -d "$targetDir" ]]; then
    success "Creating $targetDir"
    mkdir -p "$targetDir"
  fi

  success "Creating symlink from ${target} to ${source}"
  ln -s "$source" "$target"
}

if [[ -d ~/.oh-my-zsh ]]; then
  success "Seems like oh-my-zsh is installed already"
else
  warn "Installing oh-my-zsh"
  git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

install vimrc           ~/.vimrc
install vim/config      ~/.vim/config
install vim/ftplugin    ~/.vim/ftplugin
install vim/lua         ~/.vim/lua
install nvim            ~/.config/nvim
install gitconfig       ~/.gitconfig
install gitignore       ~/.gitignore
install aliases         ~/.aliases
install zshrc           ~/.zshrc
install dircolors       ~/.dircolors
install tmux.conf       ~/.tmux.conf
install pryrc           ~/.pryrc
install aalin.zsh-theme ~/.oh-my-zsh/themes/aalin.zsh-theme
install alacritty.yml   ~/.config/alacritty/alacritty.yml

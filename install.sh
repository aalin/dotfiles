#!/bin/bash

set -e

ROOT=$(dirname "$(greadlink -f "$0")")

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

function setupVundle() {
  local vimBundleDir=~/.vim/bundle
  local vundleDir="$vimBundleDir/Vundle.vim"

  if [[ ! -d "$vundleDir" ]]; then
    echo "Setting up vundle"

    mkdir -p "$vimBundleDir"

    git clone https://github.com/VundleVim/Vundle.vim.git "$vundleDir"
    vim +PluginInstall +qall
  fi
}

install vimrc           ~/.vimrc
install gitconfig       ~/.gitconfig
install gitignore       ~/.gitignore
install aliases         ~/.aliases
install zshrc           ~/.zshrc
install dircolors       ~/.dircolors
install tmux.conf       ~/.tmux.conf
install pryrc           ~/.pryrc
install aalin.zsh-theme ~/.oh-my-zsh/themes/aalin.zsh-theme
install alacritty.yml   ~/.config/alacritty/alacritty.yml

setupVundle

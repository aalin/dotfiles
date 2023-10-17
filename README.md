# My dotfiles

## Installation

Simply run `install.sh` to set up symlinks.

## Recommended packages

### MacOS

```bash
brew install \
    coreutils \
    neovim \
    git \
    ripgrep \
    fd \
    fzf \
    tree \
    mosh
```

## `ABC Sweden.bundle`

This is a modified version of the English ABC keyboard layout that comes with MacOS.
It supports åäö by holding the option key. Caps lock enables the full Swedish layout.

To disable the annoying caps lock indicator in Sonoma:

```bash
sudo mkdir -p /Library/Preferences/FeatureFlags/Domain
sudo /usr/libexec/PlistBuddy -c "Add 'redesigned_text_cursor:Enabled' bool false" /Library/Preferences/FeatureFlags/Domain/UIKit.plist
```

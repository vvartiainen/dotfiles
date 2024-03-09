#!/bin/bash

# Symlink dotfiles
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/wezterm ~/.config/wezterm
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

# Add .zsh_profile
echo "source ~/dotfiles/zsh/.zsh_profile" >>~/.zsh_profile

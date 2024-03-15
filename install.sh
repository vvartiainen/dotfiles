#!/bin/bash

# Symlink dotfiles
ln -s ~/prog/dotfiles/nvim ~/.config/nvim
ln -s ~/prog/dotfiles/wezterm ~/.config/wezterm
ln -s ~/prog/dotfiles/.gitconfig ~/.gitconfig

ln -s ~/prog/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Add .zsh_profile
echo "source ~/dotfiles/zsh/.zsh_profile" >>~/.zsh_profile

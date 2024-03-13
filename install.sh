#!/bin/bash

# Symlink dotfiles
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/wezterm ~/.config/wezterm
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

ln -s ~/dotfiles/tmux ~/.config/tmux
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Add .zsh_profile
echo "source ~/dotfiles/zsh/.zsh_profile" >>~/.zsh_profile

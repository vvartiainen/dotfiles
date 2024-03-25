#!/bin/bash
set -e

mkdir -p ~/prog/dotfiles

git clone https://github.com/vvartiainen/.config ~/prog/dotfiles

# oh-my-zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-autosuggestions

# Tmux & plugin manager installation
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Browser
brew install arc

# Terminal
brew install wezterm

# Spotlight replaced with Raycast
brew install raycast

# Requirements for vim setup
brew install ripgrep
brew install fd
brew install lazygit
brew install gnu-sed
brew install luajit
brew install stylua
brew install tree-sitter
brew install wget

# Nerdfont
brew tap homebrew/cask-fonts
brew install font-ubuntu-mono-nerd-font

# Misc
brew install thefuck
brew install asdf
brew install nvm
brew install shellcheck

# Symlink dotfiles
ln -s ~/prog/dotfiles/nvim ~/.config/nvim
ln -s ~/prog/dotfiles/wezterm ~/.config/wezterm
ln -s ~/prog/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/prog/dotfiles/tmux/tmux.conf ~/.tmux.conf
mv ~/Library/Application\ Support/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml.bk
ln -s ~/prog/dotfiles/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml

# Add .zsh_config
echo "source ~/prog/dotfiles/.zsh_config" >>~/.zshrc

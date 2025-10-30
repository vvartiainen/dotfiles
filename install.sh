#!/bin/bash
set -e

mkdir -p ~/prog/dotfiles

git clone https://github.com/vvartiainen/.config ~/prog/dotfiles

brew bundle ~/prog/dotfiles

# oh-my-zsh install
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/fast-syntax-highlighting

# Devtools
xcode-select --install
sudo /usr/sbin/DevToolsSecurity -enable

# npm & python installs
python3 -m pip install --user --upgrade pynvim
npm install -g tree-sitter-cli
npm install -g neovim

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o "$HOME"/Library/Fonts/sketchybar-app-font.ttf
brew services start sketchybar

# Tmux & plugin manager installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Installation for https://github.com/mikesmithgh/kitty-scrollback.nvim
# nvim --headless +'KittyScrollbackGenerateKittens'
# nvim +'KittyScrollbackCheckHealth'

# Symlink dotfiles
ln -s ~/prog/dotfiles/nvim ~/.config/nvim
ln -s ~/prog/dotfiles/wezterm ~/.config/wezterm
ln -s ~/prog/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/prog/dotfiles/tmux/tmux.conf ~/.tmux.conf

mv ~/Library/Application\ Support/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml.bk
ln -s ~/prog/dotfiles/lazygit.yml ~/Library/Application\ Support/lazygit/config.yml

ln -s ~/prog/dotfiles/biome.json ~/biome.json
ln -s ~/prog/dotfiles/rgignore ~/.rgignore
ln -s ~/prog/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

mkdir -p ~/.config/skhd
mkdir -p ~/.config/yabai
ln -s ~/prog/dotfiles/skhd/skhdrc ~/.config/skhd/skhdrc
ln -s ~/prog/dotfiles/yabai/yabairc ~/.config/yabai/yabairc

ln -s ~/prog/dotfiles/sketchybar ~/.config/sketchybar

# Add .zsh_config
echo "source ~/prog/dotfiles/.zsh_config" >>~/.zshrc

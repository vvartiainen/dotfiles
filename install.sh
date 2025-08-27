#!/bin/bash
set -e

mkdir -p ~/prog/dotfiles

git clone https://github.com/vvartiainen/.config ~/prog/dotfiles

# oh-my-zsh install
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
brew install zsh-autosuggestions
brew install zsh-autocomplete
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/fast-syntax-highlighting

# Tmux & plugin manager installation
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

brew install arc
brew install kitty
brew install wezterm
brew install raycast

brew install ripgrep
brew install fd
brew install lazygit
brew install lsd
brew install cmake
brew install gnu-sed
brew install luajit
brew install stylua
brew install tree-sitter
brew install tree-sitter-cli
brew install wget
brew install luarocks
brew install pgformatter
brew install hadolint
brew install composer
brew install julia
brew install fish
brew install sqlite
brew install fzf
brew install jq
brew install ffmpegthumbnailer unar poppler zoxide
brew install btop
brew install tldr
brew install thefuck
brew install asdf
brew install nvm
brew install shellcheck
brew install bat
brew install neofetch
brew install delve # golang debug
brew install scc
brew install git-delta
brew install atuin
brew install libpq

brew install zig

# Window management, check yabai docs for more info about requirements
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# Nerdfont
brew tap homebrew/cask-fonts
brew install font-symbols-only-nerd-font
brew install font-ubuntu-mono-nerd-font
brew install font-jetbrains-mono-nerd-font

cd ~/prog
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
tar -xvf nvim-macos-arm64.tar.gz

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

# asdf
ln -s ~/prog/dotfiles/tool-versions ~/.tool-versions
asdf plugin add nodejs
asdf plugin add terraform
asdf plugin add java
asdf plugin add python
asdf install

# npm & python installs
python3 -m pip install --user --upgrade pynvim
npm install -g tree-sitter-cli
npm install -g neovim

# Add .zsh_config
echo "source ~/prog/dotfiles/.zsh_config" >>~/.zshrc

# Misc
xcode-select --install
sudo /usr/sbin/DevToolsSecurity -enable

# Sketchybar
brew tap FelixKratz/formulae
brew install sketchybar

curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o "$HOME"/Library/Fonts/sketchybar-app-font.ttf

brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
brew install font-sf-pro
brew install --cask sf-symbols

brew services start sketchybar

# Installation for https://github.com/mikesmithgh/kitty-scrollback.nvim
# nvim --headless +'KittyScrollbackGenerateKittens'
# nvim +'KittyScrollbackCheckHealth'

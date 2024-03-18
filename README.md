# .config

This repo contains the configuration files for my macOS environment.

## Requirements

- brew packages
- oh my zsh
- wezterm
- nvim

## Installation

Just pull the repo to `~/prog/dotfiles` and run the install script:

```sh
mkdir -p ~/prog/dotfiles
git clone https://github.com/vvartiainen/.config ~/prog/dotfiles

# Tmux plugin manager installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Requirements for vim setup
brew install ripgrep
brew install fd
brew install lazygit
brew install gnu-sed
brew install luajit
brew install stylua
brew install tree-sitter


brew tap homebrew/cask-fonts
brew install font-ubuntu-mono-nerd-font

./install.sh

# If tpm is not working/icons not showing then run this
# ~/.tmux/plugins/tpm/bin/install_plugins
```

## tmux plugins

tmux plugins can be updated with
`~/.tmux/plugins/tpm/bin/update_plugins all`

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

./install.sh

# If tpm is not working/icons not showing then run this
# ~/.tmux/plugins/tpm/bin/install_plugins
```

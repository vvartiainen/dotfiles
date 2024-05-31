# dotfiles

This repo contains the configuration files for my macOS environment.

**IMPORTANT: Don't expect things to work out of the box for you, read through the configs and understand what is going on before applying them for yourself**

## Requirements

- brew - to install the required packages

## Installation

Just pull the repo to `~/prog/dotfiles` and install requirements with:

```sh
./install.sh
```

## tmux plugins

tmux plugins can be updated with
`~/.tmux/plugins/tpm/bin/update_plugins all`

## Misc

- Unbind change input from macOS keyboard settings (conflicts with tmux copy mode)
- ShaDa error can be fixed with `:wshada!` which force overwrites it
- Empty LSP logs from time to time `echo > /Users/vvarti/.local/state/nvim/lsp.log`

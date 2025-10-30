# dotfiles

This repo contains the configuration files for my macOS environment.

**IMPORTANT: Don't expect things to work out of the box for you.**

**Read through the configs and understand what is going on before applying them for yourself**

*Screenshot showcasing the setup with editor and browser with window tiling*
![screenshot](./screenshot.png)

## Features

The setup aims to remove as much friction as possible from using and navigating
the system between different workspaces and contexts.

**"Removing friction"** means that the keybinds should be intuitive and you should
be able to perform most actions with just 2-3 keyboard inputs and without
reaching for a mouse.

Also, animations should be kept to minimum. It's surprisingly satisfying
to move between the browser and coding spaces instantaneously without the Apple
animations. I've also noticed that even though I used to like smooth scrolling,
I have it disabled now whenever possible to make the system feel as responsive
as possible.

### UI / Window management / Navigation

Yabai is used for window management and window tiling. System Identity Protection has to be disabled for all Yabai features to work, refer to Yabai documentation when doing the installation.

Moving between spaces happens easily with `CTRL + <workspace index>`.

Changing focus between different windows or applications in workspace: `CTRL + DOWN`

*Also, I have rebound my `CAPSLOCK` to `CTRL` for slightly more ergonomic hand position when using the laptop internal keyboard.*

I have assigned some applications to specific workspaces, for example:

- Space 1 -> Instant messaging etc.
- Space 2 -> Browser
- Space 3 -> Coding workspace
- Space 4 -> Notetaking
- Space 5 -> Misc & videos

Moving active window between spaces can be done with `CTRL + OPT + CMD - <workspace index OR left arrow OR right arrow>`

**skhd** is used to manage yabai keybinds.

**Sketchybar** is used to customize the macOS menubar, most important feature is
to show the workspaces there.

**catppuccin mocha** is the colorscheme I try to use everywhere.

### Editor & tools

**Neovim** with **LazyVim** and a bunch of plugins and custom configuration is used for code editing and note taking.

**Lazygit** is fantastic and integrates nicely with Neovim. I never really liked Git UIs but after trying and learning Lazygit there's no going back. I'd still recommend to learn Git on the command line before starting to use this tool.

**yazi** is a great file management tool in terminal, it has nice integrations with fzf, zoxide and rg and it's using Vim keybindings.

### Terminal

**Kitty** is used as the terminal emulator. It's very snappy and has pretty nice
features like shell integrations and support for editing or transfering files via SSH.

I'm **not** using terminal multiplexers like tmux or screen except for remote
SSH connections where I might need to persist long running tasks/sessions. Kitty
tabs and windows work fine for me locally and I haven't had the need to persist those
kind of sessions in the background.

`z` (zoxide) is used to navigate quickly to directories I visit often, it's as simple as `z dot` to navigate to `~/prog/dotfiles/` as an example.

`fzf` with shell integration is great and can be used to fuzzy find command history (`CTRL+R`) or files (`CTRL+T`).

Some small CLI tools to highlight:

- `brew` as a package manager
- `mise` to manage runtime versions of programming languages
- `oh-my-zsh` and various plugins it comes with (auto complete and syntax highlighting are the most important ones)
- `zoxide` to navigate between directories I've visited before
- `fzf` for fuzzy finding shell history, aliases, keybinds, ls output etc.
- `lazygit`
- `lsd` for beautiful ls outputs
- `bat` - cat but with syntax highlighting
- `btop` a beautiful replacement for top
- `atuin` for shell history
- `yazi` for file management
- `ripgrep` and `fd` to replace grep and find

## Installation

Example installation script in `./install.sh`. Modify where needed.

## Misc & errors

- Unbind change input from macOS keyboard settings (conflicts with tmux copy mode)
- ShaDa error can be fixed with `:wshada!` which force overwrites it
- Empty LSP logs from time to time `echo > /Users/vvarti/.local/state/nvim/lsp.log`
- tmux plugins can be updated with `~/.tmux/plugins/tpm/bin/update_plugins all`
- `reloadall` & `reloadyabai` if something is stuck after reboot
- Check that yabai requirements (SIP and nvram) stay as is after OS updates
- Empty nvim cache: `rm -rf ~/.cache/nvim/luac`

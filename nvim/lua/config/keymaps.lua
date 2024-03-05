-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- € to $ for easier access
vim.api.nvim_set_keymap("n", "€", "$", { noremap = true, silent = true })

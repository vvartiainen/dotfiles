-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- € to $ for easier access on Finnish layout
vim.api.nvim_set_keymap("n", "€", "$", { silent = true, desc = "End of line" })
vim.api.nvim_set_keymap("o", "€", "$", { silent = true, desc = "End of line" })
vim.api.nvim_set_keymap("x", "€", "$", { silent = true, desc = "End of line" })
vim.api.nvim_set_keymap("s", "€", "$", { silent = true, desc = "End of line" })
vim.api.nvim_set_keymap("v", "€", "$", { silent = true, desc = "End of line" })

-- map ö and ä to square brackets in all modes
vim.api.nvim_set_keymap("n", "ä", "]", {})
vim.api.nvim_set_keymap("n", "ö", "[", {})

-- map å and ¨ to curly braces
vim.api.nvim_set_keymap("n", "å", "{", {})
vim.api.nvim_set_keymap("n", "¨", "}", {})

-- copilot enable & disable
vim.api.nvim_set_keymap("n", "<leader>coe", ":Copilot enable<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cod", ":Copilot disable<CR>", { noremap = true, silent = true })

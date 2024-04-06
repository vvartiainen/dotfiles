local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "catppuccin-mocha" } },
  checker = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
      },
    },
  },
})

-- disable Copilot by default
vim.cmd("silent! Copilot disable")

-- Disable Ruby and Perl providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- disable spellcheck by default
vim.opt.spell = false
vim.opt.spelllang = ""
vim.opt.spellfile = ""
vim.opt.spellcapcheck = ""

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      auto_install = true,
      ensure_installed = {
        "svelte",
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "javascript",
        "typescriptreact",
        "javascriptreact",
        "json",
        "yaml",
        "swift",
        "css",
        "html",
        "lua",
        "python",
        "terraform",
        "go",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
}

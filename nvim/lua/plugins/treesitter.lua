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
        "json",
        "yaml",
        "swift",
        "css",
        "html",
        "lua",
        "python",
        "terraform",
        "go",
        "regex",
        "jsonc",
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

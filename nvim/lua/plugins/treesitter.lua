return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    ensure_installed = {
      "css",
      "dockerfile",
      "go",
      "gomod",
      "gosum",
      "html",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "regex",
      "svelte",
      "terraform",
      "tsx",
      "typescript",
      "yaml",
      "zig",
    },
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
  },
}

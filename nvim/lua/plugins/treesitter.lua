return {
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
      "jsonc",
      "yaml",
      "swift",
      "css",
      "html",
      "lua",
      "python",
      "terraform",
      "go",
      "gosum",
      "gomod",
      "dockerfile",
      "regex",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}

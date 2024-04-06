return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  opts = {
    ensure_installed = {
      "bash-language-server",
      "biome",
      "black",
      "codelldb",
      "eslint-lsp",
      "gopls",
      "jq",
      "json-lsp",
      "lua-language-server",
      "markdownlint",
      "marksman",
      "pyright",
      "quick-lint-js",
      "rust-analyzer",
      "shfmt",
      "sqlfluff",
      "stylua",
      "svelte-language-server",
      "tailwindcss-language-server",
      "taplo",
      "terraform-ls",
      "typescript-language-server",
      "yaml-language-server",
    },
  },
}

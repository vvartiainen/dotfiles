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
      "gofumpt",
      "goimports",
      "golangci-lint",
      "golangci-lint-langserver",
      "golines",
      "gopls",
      "hadolint",
      "html-lsp",
      "jq",
      "json-lsp",
      "lua-language-server",
      "markdownlint",
      "marksman",
      "markdown-toc",
      "prettier",
      "prettierd",
      "pyright",
      "quick-lint-js",
      "rust-analyzer",
      "rustywind",
      "shellcheck",
      "shfmt",
      "sqlfluff",
      "stylua",
      "svelte-language-server",
      "tailwindcss-language-server",
      "taplo",
      "terraform-ls",
      "typescript-language-server",
      "vtsls",
      "yaml-language-server",
    },
  },
}

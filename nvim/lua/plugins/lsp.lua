return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "j-hui/fidget.nvim", opts = {} },
  },
  opts = {
    inlay_hints = { enabled = false },

    servers = {
      tsserver = {
        on_attach = function(client)
          -- biome/prettier is used for formatting, conform.lua
          client.server_capabilities.documentFormattingProvider = false
        end,
      },
      biome = {},
      bashls = {},
      svelte = {},
      sourcekit = {},
      gopls = {},
      eslint = {
        autostart = false,
      },
      tailwindcss = {},
      terraformls = {},
      sqlls = {},
      marksman = {},
    },
  },
}

return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  opts = {
    servers = {
      tsserver = {
        on_attach = function(client)
          -- biome is used for formatting
          client.server_capabilities.documentFormattingProvider = false
        end,
      },
      biome = {},
      svelte = {},
      sourcekit = {},
    },
  },
}

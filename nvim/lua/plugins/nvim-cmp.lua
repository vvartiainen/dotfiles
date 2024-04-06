return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "rafamadriz/friendly-snippets",
    "j-hui/fidget.nvim",
    "zbirenbaum/copilot.lua",
  },

  opts = {
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
  },
  config = function()
    local cmp = require("cmp")
    require("fidget").setup({})

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "copilot" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}

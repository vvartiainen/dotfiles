return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "rafamadriz/friendly-snippets",
    "j-hui/fidget.nvim",
    "onsails/lspkind.nvim",
    "zbirenbaum/copilot.lua",
    "roobert/tailwindcss-colorizer-cmp.nvim",
  },
  config = function()
    local cmp = require("cmp")

    require("luasnip.loaders.from_vscode").lazy_load()

    local lspkind = require("lspkind")

    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })

    require("fidget").setup({})

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm(),
      }),
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "copilot" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
      formatting = {
        expandable_indicator = true,
        fields = { "abbr", "kind", "menu" },
        format = lspkind.cmp_format({
          mode = "text_symbol",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
          before = require("tailwindcss-colorizer-cmp").formatter,
        }),
      },
    })
  end,
}

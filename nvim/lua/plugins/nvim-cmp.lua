return {
  "saghen/blink.cmp",
  version = not vim.g.lazyvim_blink_main and "*",
  build = vim.g.lazyvim_blink_main and "cargo build --release",
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
  },
  dependencies = {
    "rafamadriz/friendly-snippets",
    { "saghen/blink.compat", opts = {} },
  },
  event = "InsertEnter",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    highlight = {
      use_nvim_cmp_as_default = false,
    },
    nerd_font_variant = "mono",
    windows = {
      autocomplete = {
        winblend = vim.o.pumblend,
      },
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        enabled = vim.g.ai_cmp,
      },
    },

    accept = { auto_brackets = { enabled = true } },

    sources = {
      compat = {},
      completion = {
        -- remember to enable your providers here
        enabled_providers = { "lsp", "path", "snippets", "buffer" },
      },
    },

    keymap = {
      preset = "default",
      ["<Tab>"] = {
        LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
        "fallback",
      },
    },
  },
  ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
  config = function(_, opts)
    -- setup compat sources
    local enabled = opts.sources.completion.enabled_providers
    for _, source in ipairs(opts.sources.compat or {}) do
      opts.sources.providers[source] = vim.tbl_deep_extend(
        "force",
        { name = source, module = "blink.compat.source" },
        opts.sources.providers[source] or {}
      )
      if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
        table.insert(enabled, source)
      end
    end
    require("blink.cmp").setup(opts)
  end,
}

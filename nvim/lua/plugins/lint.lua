return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        fish = { "fish" },
        javascript = { "biomejs", "quick-lint-js", "eslint" },
        typescript = { "biomejs", "quick-lint-js", "eslint" },
        typescriptreact = { "biomejs", "quick-lint-js", "eslint" },
        -- Use the "*" filetype to run linters on all filetypes.
        -- ['*'] = { 'global linter' },
        -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
        -- ['_'] = { 'fallback linter' },
      },
    },
  },
}

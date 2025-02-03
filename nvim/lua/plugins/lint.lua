return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      bash = { "shellcheck" },
      zsh = { "zsh", "shellcheck" },
      sh = { "shellcheck" },
      shell = { "shellcheck" },
      sql = { "sqlfluff" },
      -- markdown = { "markdownlint" },
      -- javascript = { "quick-lint-js", "eslint" },
      -- typescript = { "quick-lint-js", "eslint" },
      -- typescriptreact = { "quick-lint-js", "eslint" },
      -- Use the "*" filetype to run linters on all filetypes.
      -- ['*'] = { 'global linter' },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    },
  },
}

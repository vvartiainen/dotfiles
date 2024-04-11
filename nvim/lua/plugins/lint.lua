return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      bash = { "shellcheck" },
      javascript = { "biomejs", "quick-lint-js", "eslint" },
      markdown = { "markdownlint" },
      sh = { "shellcheck" },
      shell = { "shellcheck" },
      sql = { "sqlfluff" },
      typescript = { "biomejs", "quick-lint-js", "eslint" },
      typescriptreact = { "biomejs", "quick-lint-js", "eslint" },
      zsh = { "zsh", "shellcheck" },
      -- Use the "*" filetype to run linters on all filetypes.
      -- ['*'] = { 'global linter' },
      -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
      -- ['_'] = { 'fallback linter' },
    },
  },
}

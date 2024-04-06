local function biome_lsp_or_prettier()
  local has_prettier = vim.fs.find({
    -- https://prettier.io/docs/en/configuration.html
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.json5",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.toml",
    "prettier.config.js",
    "prettier.config.cjs",
  }, { upward = true })[1]
  if has_prettier then
    return { "prettier" }
  end
  return { "biome" }
end

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = biome_lsp_or_prettier,
        javascriptreact = biome_lsp_or_prettier,
        typescript = biome_lsp_or_prettier,
        typescriptreact = biome_lsp_or_prettier,
        json = biome_lsp_or_prettier,
        yaml = { "prettier" },
        markdown = { "markdownlint" },
        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        rust = { "rustanalyzer" },
        go = { "gofmt" },
        sql = { "pg_format", "sqlfluff" },
        xml = { "xmlformatter" },
        terraform = { "terraform_fmt" },
        tf = { "terraform_fmt" },
        tfvars = { "terraform_fmt" },
        zsh = { "shfmt", "shellcheck" },
        bash = { "shfmt", "shellcheck" },
        shell = { "shfmt", "shellcheck" },
        sh = { "shfmt", "shellcheck" },
      },
    },
  },
}

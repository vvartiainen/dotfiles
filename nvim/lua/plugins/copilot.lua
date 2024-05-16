return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  opts = {
    filetypes = {
      css = true,
      go = true,
      javascript = true,
      javascriptreact = true,
      lua = true,
      sh = true,
      svelte = true,
      tf = true,
      terraform = true,
      typescript = true,
      typescriptreact = true,
      ["*"] = false,
    },
  },
  config = function()
    require("copilot").setup({})
    -- Disable by default
    require("copilot.command").disable()
  end,
}

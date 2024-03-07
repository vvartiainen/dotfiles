return {
  -- js & ts
  { import = "lazyvim.plugins.extras.lang.typescript" },
  -- lsp-config
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
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show line diagnostics"
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Show documentation for what is under cursor"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    end

    -- sourcekit-lsp for swift
    lspconfig["sourcekit"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = {
        "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
      },
      root_dir = function(filename, _)
        return util.root_pattern("buildServer.json")(filename)
          or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
          or util.find_git_ancestor(filename)
          or util.root_pattern("Package.swift")(filename)
      end,
    })

    -- svelte
    lspconfig["svelte"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "svelteserver", "--stdio" },
      filetypes = { "svelte" },
      root_dir = function(filename)
        return util.root_pattern("package.json", "svelte.config.js", ".git")(filename)
      end,
    })

    -- biome
    lspconfig["biome"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { "biome", "lsp" },
      filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact" },
      root_dir = function(filename)
        return util.root_pattern("package.json", ".git")(filename)
      end,
    })
  end,
}

return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        selection = {
          auto_insert = false,
          preselect = false,
        },
      },
    },
    keymap = {
      preset = "default",
      ["<C-e>"] = {
        function(cmp)
          cmp.show({ providers = { "snippets" } })
        end,
      },
    },
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "-",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
    },
  },
}

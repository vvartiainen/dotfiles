return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    --     local logo = [[
    --                                  __
    --                                 /\ \__  __
    --  __  __   __  __     __     _ __\ \ ,_\/\_\
    -- /\ \/\ \ /\ \/\ \  /'__`\  /\`'__\ \ \/\/\ \
    -- \ \ \_/ |\ \ \_/ |/\ \L\.\_\ \ \/ \ \ \_\ \ \
    --  \ \___/  \ \___/ \ \__/.\_\\ \_\  \ \__\\ \_\
    --   \/__/    \/__/   \/__/\/_/ \/_/   \/__/ \/_/
    --     ]]

    local logo = [[
                        __                                                                
                       /\ \__  __            __                              __           
 __  __     __     _ __\ \ ,_\/\_\     __   /\_\    ___      __    ___      /\_\    ___   
/\ \/\ \  /'__`\  /\`'__\ \ \/\/\ \  /'__`\ \/\ \ /' _ `\  /'__`\/' _ `\    \/\ \  / __`\ 
\ \ \_/ |/\ \L\.\_\ \ \/ \ \ \_\ \ \/\ \L\.\_\ \ \/\ \/\ \/\  __//\ \/\ \  __\ \ \/\ \L\ \
 \ \___/ \ \__/.\_\\ \_\  \ \__\\ \_\ \__/.\_\\ \_\ \_\ \_\ \____\ \_\ \_\/\_\\ \_\ \____/
  \/__/   \/__/\/_/ \/_/   \/__/ \/_/\/__/\/_/ \/_/\/_/\/_/\/____/\/_/\/_/\/_/ \/_/\/___/
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
          { action = "Telescope projects",                                       desc = " Projects",        icon = " ", key = "p", },
          { action = LazyVim.pick("files"),                                      desc = " Find File",       icon = " ", key = "f" },
          { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}

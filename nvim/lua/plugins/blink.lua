local function select_next_idx(idx, dir)
  dir = dir or 1

  local list = require("blink.cmp.completion.list")
  if #list.items == 0 then
    return
  end

  local target_idx
  if list.selected_item_idx == nil then
    if dir == 1 then
      target_idx = idx
    else
      target_idx = #list.items - idx
    end
  elseif list.selected_item_idx == #list.items then
    if dir == 1 then
      target_idx = 1
    else
      target_idx = #list.items - idx
    end
  elseif list.selected_item_idx == 1 and dir == -1 then
    target_idx = #list.items - idx
  else
    target_idx = list.selected_item_idx + (idx * dir)
  end

  if target_idx < 1 then
    target_idx = 1
  elseif target_idx > #list.items then
    target_idx = #list.items
  end

  list.select(target_idx)
end

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
      ["<PageDown>"] = {
        function(cmp)
          if not cmp.is_visible() then
            return
          end
          vim.schedule(function()
            select_next_idx(5)
          end)
          return true
        end,
        "fallback",
      },
      ["<PageUp>"] = {
        function(cmp)
          if not cmp.is_visible() then
            return
          end
          vim.schedule(function()
            select_next_idx(5, -1)
          end)
          return true
        end,
        "fallback",
      },
    },
  },
}

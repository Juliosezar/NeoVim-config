return {
  "pocco81/auto-save.nvim",
  event = { "InsertLeave", "TextChanged" }, -- autosave on leaving insert or text change
  config = function()
    require("auto-save").setup({
      enabled = true,
      execution_message = {
        message = function() return "💾 AutoSave" end,
        dim = 0.18,
        cleaning_interval = 1250,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        return fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {})
      end,
    })
  end,
}


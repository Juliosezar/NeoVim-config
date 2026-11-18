return {
  "Xuyuanp/scrollbar.nvim",
  init = function()
    local group = vim.api.nvim_create_augroup("scrollbar_init", { clear = true })

    vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "WinScrolled", "WinResized", "FocusGained" }, {
      group = group,
      desc = "Show or refresh scrollbar",
      pattern = "*",
      callback = function()
        pcall(function() require("scrollbar").show() end)
      end,
    })

    vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
      group = group,
      desc = "Clear scrollbar from inactive window",
      pattern = "*",
      callback = function()
        pcall(function() require("scrollbar").clear() end)
      end,
    })
  end,
}


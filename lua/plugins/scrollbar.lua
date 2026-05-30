return {
  "Xuyuanp/scrollbar.nvim",
  init = function()
    local group = vim.api.nvim_create_augroup("scrollbar_init", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "WinScrolled", "WinResized" }, {
      group = group,
      desc = "Show or refresh scrollbar",
      pattern = "*",
      callback = function()
        pcall(function() require("scrollbar").show() end)
      end,
    })
  end,
}

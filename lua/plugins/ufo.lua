return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufReadPost",
  config = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99   -- Using ufo provider requires high foldlevel
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        return { "lsp", "indent" } -- Use LSP and indent as fallback
      end,
    })

    -- Optional: Keymaps
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
  end
}


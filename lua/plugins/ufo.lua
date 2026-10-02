return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufReadPost",
  config = function()
    vim.o.foldcolumn = "1"
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require("ufo").setup({
      provider_selector = function(bufnr, filetype, buftype)
        -- Custom provider mapping
        local ft_map = {
          vue = { "treesitter", "indent" },
          svelte = { "treesitter", "indent" },
          html = { "treesitter", "indent" },
        }
        return ft_map[filetype] or { "lsp", "indent" }
      end,
    })

    -- UFO recommends zR / zM for open/close all folds
    -- (zo/zc in Vim are meant to open/close single folds under the cursor)
    vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
    vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
  end,
}

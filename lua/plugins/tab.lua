return {
  'romgrk/barbar.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
    { 'lewis6991/gitsigns.nvim', lazy = true },
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  config = function()
    require('barbar').setup {
	exclude_ft   = { "" },
      	exclude_name = { "" },
		}


    -- Navigation
    vim.keymap.set("n", "<leader>h", "<cmd>BufferPrevious<cr>", { desc = "Prev Buffer" })
    vim.keymap.set("n", "<leader>l", "<cmd>BufferNext<cr>", { desc = "Next Buffer" })

    -- Reordering
    vim.keymap.set("n", "<leader>tj", "<cmd>BufferMovePrevious<cr>", { desc = "Move Buffer Prev" })
    vim.keymap.set("n", "<leader>tk", "<cmd>BufferMoveNext<cr>", { desc = "Move Buffer Next" })

    -- Close buffers
    vim.keymap.set("n", "<leader>bc", "<cmd>bd!<cr>", { desc = "Close Buffer" })
    vim.keymap.set("n", "<leader><bl", "<cmd>BufferCloseLeft<cr>", { desc = "Close Buffers to Left" })
    vim.keymap.set("n", "<leader><br", "<cmd>BufferCloseRight<cr>", { desc = "Close Buffers to Right" })
    vim.keymap.set("n", "<leader>bo", "<cmd>BufOnly<cr>", { desc = "Close All But Current" })
  end
}


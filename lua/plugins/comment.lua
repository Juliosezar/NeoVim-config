return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
  lazy = false, -- load on startup
  -- Normal mode: comment current line
vim.keymap.set('n', '<leader>ccc', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle comment on current line' });

-- Visual mode: comment selected lines
vim.keymap.set('v', '<leader>ccc', function()
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment on selected lines' })

}


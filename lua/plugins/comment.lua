return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
  lazy = false, -- load on startup
  -- Normal mode: comment current line
vim.keymap.set('n', '<leader>cc', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle comment on current line' });

-- Visual mode: comment selected lines
vim.keymap.set('v', '<leader>cc', function()
  require('Comment.api').toggle.linewise(vim.fn.visalmode())
end, { desc = 'Toggle comment on selected lines' })

}


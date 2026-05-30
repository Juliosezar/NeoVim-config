return {
    'numToStr/Comment.nvim',
    keys = {
        { "<leader>nn", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line" },
        { "<leader>nn", "<Plug>(comment_toggle_linewise_visual)", mode = "v", desc = "Comment toggle visual selection" },
    },
    config = function()
        require('Comment').setup()
    end
}

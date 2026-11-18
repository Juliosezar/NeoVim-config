return {
    "romgrk/barbar.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        exclude_ft        = { "" },
        exclude_name      = { "" },
        animation         = true,
        sidebar_filetypes = {
            NvimTree = true,
        },
        maximum_padding   = 2,
        icons             = {
            -- Try preset = "slanted" or "powerline" if you want angled tabs
            preset = "default",
            buffer_index = false,
            buffer_number = false,
            button = "×",
            separator = { left = "▎", right = "" },
            separator_at_end = false,
            modified = { button = "●" },
            pinned = { button = "", filename = true },
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
                [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
            },
        },
    },
    keys = {
        -- Navigation
        { "<leader>h",  "<cmd>BufferPrevious<cr>",           desc = "Prev Buffer" },
        { "<leader>l",  "<cmd>BufferNext<cr>",               desc = "Next Buffer" },

        -- Reordering
        { "<leader>tj", "<cmd>BufferMovePrevious<cr>",       desc = "Move Buffer Prev" },
        { "<leader>tk", "<cmd>BufferMoveNext<cr>",           desc = "Move Buffer Next" },

        -- Close buffers
        { "<leader>bc", "<cmd>BufferClose<cr>",              desc = "Close Buffer" },
        { "<leader>bL", "<cmd>BufferCloseBuffersLeft<cr>",   desc = "Close Buffers Left" },
        { "<leader>bR", "<cmd>BufferCloseBuffersRight<cr>",  desc = "Close Buffers Right" },
        { "<leader>bo", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Close All But Current" },
    },
}

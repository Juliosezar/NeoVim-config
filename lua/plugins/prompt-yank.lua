return {
    "polacekpavel/prompt-yank.nvim",
    -- Load the plugin only when you actually call the command or the keymaps
    cmd = { "PromptYank" }, 
    keys = {
        -- Set up quick hotkeys (change these to whatever feels comfortable!)
    { "<Leader>yp", mode = { "n", "v" }, desc = "PromptYank: file/selection" },
    { "<Leader>ym", mode = "n", desc = "PromptYank: multi-file" },
    { "<Leader>yd", mode = { "n", "v" }, desc = "PromptYank: diff" },
    { "<Leader>yb", mode = { "n", "v" }, desc = "PromptYank: blame" },
    { "<Leader>ye", mode = "v", desc = "PromptYank: diagnostics" },
    { "<Leader>yt", mode = { "n", "v" }, desc = "PromptYank: tree" },
    { "<Leader>yr", mode = { "n", "v" }, desc = "PromptYank: remote URL" },
    { "<Leader>yf", mode = "n", desc = "PromptYank: function" },
    { "<Leader>yl", mode = "v", desc = "PromptYank: selection + definitions" },
    { "<Leader>yL", mode = "v", desc = "PromptYank: selection + deep definitions" },
    { "<Leader>yR", mode = "n", desc = "PromptYank: related files" },
    },
    config = function()
        require("prompt-yank").setup({
            -- Options are 'markdown' or 'xml' (Claude handles XML exceptionally well)
            style = "markdown", 
            
            -- Strips out empty lines or comments if you want to save context tokens
            strip_empty_lines = true,
            strip_comments = false,
            
            -- Automatically paths relative to your git root/working directory
            file_path_type = "relative", 
        })
    end,
}

return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup({
        -- your configuration comes here
        -- override = {
        --   zsh = {
        --     icon = "",
        --     color = "#428850",
        --     cterm_color = "65",
        --     name = "Zsh"
        --   }
        -- };
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        -- color_icons = true;
        -- default = true;
        -- strict = true;
        -- override_by_filename = {
        --   [".gitignore"] = {
        --     icon = "",
        --     color = "#f1502f",
        --     name = "Gitignore"
        --   }
        -- };
        -- override_by_extension = {
        --   ["log"] = {
        --     icon = "",
        --     color = "#81e043",
        --     name = "Log"
        --   }
        -- };
      })
    end,
  },
}


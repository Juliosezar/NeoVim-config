return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- load before all other UI plugins
  lazy = false,    -- load immediately at startup
  config = function()
    require("catppuccin").setup({
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        -- add more integrations if you like
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}


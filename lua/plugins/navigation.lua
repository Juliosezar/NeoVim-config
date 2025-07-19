-- lua/plugins/navigation.lua
return {
  {
    "SmiteshP/nvim-navbuddy",
    event = "LspAttach",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lsp = {
        auto_attach = true,
      },
      -- optionally add custom UI mappings here
    },
    -- map <leader>nb once the plugin loads
    keys = {
      {
        "<leader>nb",
        function() require("nvim-navbuddy").open() end,
        desc = "Navbuddy: show breadcrumbs navigator",
      },
    },
  },
}


return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "rafamadriz/friendly-snippets",
      -- 👇 Add this
      "supermaven-inc/supermaven-nvim",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "supermaven" }, -- 👈 Add this source
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
        sorting = {
          priority_weight = 2,
        },
      })
    end,
  },
}


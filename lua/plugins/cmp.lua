return {
  -- Completion framework
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- LSP source for nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
      -- Snippet completion source
      "saadparwaiz1/cmp_luasnip",
      -- Snippet engine
      "L3MON4D3/LuaSnip",
      -- Buffer completion source
      "hrsh7th/cmp-buffer",
      -- Path completion source
      "hrsh7th/cmp-path",
      -- Command-line completion source
      "hrsh7th/cmp-cmdline",
      -- Collection of snippets
      "rafamadriz/friendly-snippets",
    },
  },
}


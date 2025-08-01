-- plugins/snippets.lua
return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",  -- improve regex performance (optional)
    event = "InsertEnter",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
	"saadparwaiz1/cmp_luasnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },

  },
}


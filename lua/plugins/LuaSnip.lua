return {
  -- LuaSnip snippet engine
  {
    "L3MON4D3/LuaSnip",
    build = (vim.fn.has("win32") ~= 0) and "make install_jsregexp" or nil,
    dependencies = {
      -- Collection of snippets
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local luasnip = require("luasnip")

      -- Load snippets from friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Optional: Configure LuaSnip
      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })
    end,
  },
}


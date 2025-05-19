return {
  -- LSP Package Manager (Mason)
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Bridge between Mason and LSP
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright" }, -- Auto-install LSPs
      })
    end,
  },

  -- Main LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Lua LSP
      lspconfig.lua_ls.setup({})

      -- Python LSP
      lspconfig.pyright.setup({})

      -- C/C++ LSP
      lspconfig.clangd.setup({})
    end,
  },

  -- Autocompletion (Optional but recommended)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source
      "hrsh7th/cmp-buffer",   -- Text from buffer
      "hrsh7th/cmp-path",     -- File paths
      "L3MON4D3/LuaSnip",     -- Snippets
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP completions
          { name = "buffer" },   -- Current buffer words
          { name = "path" },     -- File paths
        }),
      })
    end,
  },
}

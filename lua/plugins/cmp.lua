-- plugins/completion.lua
return {
  {
    "saghen/blink.cmp",
    version = "*",              -- track latest stable (you can pin "1.0")
    dependencies = {
      "rafamadriz/friendly-snippets",
      { "saghen/blink.compat", optional = true },
    },
    event = "InsertEnter",
    opts = {
  snippets = {
    expand = function(snippet, _)
      return require("luasnip").lsp_expand(snippet)
    end,
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = { auto_show = true },
    ghost_text = { enabled = false },
    accept = { auto_brackets = { enabled = true } },
  },
  keymap = {
    preset = "enter",
    ["<C-y>"] = { "select_and_accept" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
  },
},
opts_extend = { "sources.default", "sources.compat" },
},
}


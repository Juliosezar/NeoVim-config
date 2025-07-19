return {
  {
    "Fildo7525/pretty_hover",
    event = "LspAttach",
    opts = {
      -- optional customizations, e.g.:
      border = "rounded",      -- rounded border style
      wrap = true,             -- wrap long lines
      max_width = 80,
      max_height = 20,
      -- customize highlights, styles, etc.
    },
    keys = {
      {
        "K",
        function() require("pretty_hover").hover() end,
        desc = "Pretty Hover (enhanced LSP hover)",
      },
    },
  },
}


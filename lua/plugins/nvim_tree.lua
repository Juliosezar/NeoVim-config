return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.cmd [[highlight NvimTreeIndentMarker guifg=#888888]]
      require("nvim-tree").setup({
        renderer = {
          indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = { corner = "└", edge = "│", item = "│", bottom = "─", none = " " },
          },
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          -- Default keymaps
          api.config.mappings.default_on_attach(bufnr)

          -- Explicit copy/cut/paste
          vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
          vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
          vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
        end,
      })
    end
  }
}


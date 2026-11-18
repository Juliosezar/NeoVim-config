return {
  "rachartier/tiny-cmdline.nvim",
  init = function()
    vim.o.cmdheight = 0
    vim.g.tiny_cmdline = {
      -- By default "/" and "?" search stay at the bottom;
      -- uncomment the next line if you also want search centered like Noice:
      native_types = {},
    }
  end,
}
-- return {
--   "folke/noice.nvim",
--     enabled = false,
--   event = "VeryLazy",
--   dependencies = {
--     "MunifTanjim/nui.nvim",
--     "nvim-treesitter/nvim-treesitter",
--     {
--       "rcarriga/nvim-notify",
--       opts = {
--         background_colour = "#1e1e2e",
--       },
--     },
--   },
--   opts = {
--     lsp = {
--       override = {
--         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--         ["vim.lsp.util.stylize_markdown"] = true,
--       },
--     },
--     presets = {
--       bottom_search = false,
--       command_palette = false,
--       long_message_to_split = true,
--       inc_rename = false,
--       lsp_doc_border = false,
--     },
--   },
-- }

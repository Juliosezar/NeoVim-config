return {
  "akinsho/toggleterm.nvim",
  version = "*", -- or a specific version/tag
  config = function()
    require("toggleterm").setup({
      size = 15,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "horizontal", -- or "vertical" | "float" | "tab"
      close_on_exit = true,
      shell = vim.o.shell,
    })

    -- Optional: keymaps for floating terminal
    vim.keymap.set("n", "<leader>tf", function()
      require("toggleterm.terminal").Terminal:new({
        direction = "float",
      }):toggle()
    end, { desc = "Toggle Floating Terminal" })
  end
}


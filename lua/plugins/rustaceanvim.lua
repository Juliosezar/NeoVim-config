return {
  "mrcjkb/rustaceanvim",
  ft = { "rust" },
  init = function()
    vim.g.rustaceanvim = {
      tools = {
        inlay_hints = {
          auto = true,
          show_parameter_hints = true,
          parameter_hints_prefix = "⬅ ",
          other_hints_prefix = "➡ ",
        },
        hover_actions = {
          border = "rounded",
        },
      },
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>ra", function()
            vim.cmd.RustLsp("codeAction")
          end, { silent = true, buffer = bufnr, desc = "Rust Code Action" })
          vim.keymap.set("n", "<leader>rr", function()
            vim.cmd.RustLsp("runnables")
          end, { silent = true, buffer = bufnr, desc = "Rust Runnables" })
          vim.keymap.set("n", "<leader>re", function()
            vim.cmd.RustLsp("expandMacro")
          end, { silent = true, buffer = bufnr, desc = "Expand Macro" })
          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, { silent = true, buffer = bufnr, desc = "Hover Actions" })
        end,
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      dap = {},
    }
  end,
}

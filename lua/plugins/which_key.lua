return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      -- Window management
      { "<leader>w", group = "window" },
      { "<leader>ww", desc = "Save" },
      { "<leader>wv", desc = "Split vertical" },
      { "<leader>ws", desc = "Split horizontal" },
      { "<leader>wd", desc = "Close window" },
      { "<leader>wc", desc = "Close window" },
      { "<leader>w=", desc = "Equal size" },
      { "<leader>w_", desc = "Max height" },
      { "<leader>w|", desc = "Max width" },
      { "<leader><leader>h", desc = "Window left" },
      { "<leader><leader>l", desc = "Window right" },
      { "<leader><leader>j", desc = "Window down" },
      { "<leader><leader>k", desc = "Window up" },

      -- Cargo / Rust builds
      { "<leader>c", group = "cargo" },
      { "<leader>cb", desc = "Build" },
      { "<leader>cr", desc = "Run" },
      { "<leader>ct", desc = "Test" },
      { "<leader>cc", desc = "Check" },
      { "<leader>cl", desc = "Clippy" },
      { "<leader>cf", desc = "Format" },
      { "<leader>cu", desc = "Update" },
      { "<leader>cd", desc = "Doc" },
      { "<leader>cx", desc = "Clean" },
      { "<leader>ca", desc = "Add dep" },
      { "<leader>cn", desc = "New project" },

      -- Rust LSP / diagnostic / resize (all under <leader>r)
      { "<leader>r", group = "rust+lsp+resize" },
      { "<leader>ra", desc = "Code Action" },
      { "<leader>rr", desc = "Runnables" },
      { "<leader>re", desc = "Expand Macro" },
      { "<leader>rd", desc = "Diagnostic list" },
      { "<leader>rl", desc = "Line diagnostic" },
      { "<leader>r<Up>", desc = "Taller" },
      { "<leader>r<Down>", desc = "Shorter" },
      { "<leader>r<Right>", desc = "Wider" },
      { "<leader>r<Left>", desc = "Narrower" },

      -- Git / Gitsigns
      { "<leader>g", group = "git" },
      { "<leader>gs", desc = "Stage hunk" },
      { "<leader>gr", desc = "Reset hunk" },
      { "<leader>gS", desc = "Stage buffer" },
      { "<leader>gu", desc = "Undo stage" },
      { "<leader>gR", desc = "Reset buffer" },
      { "<leader>gp", desc = "Preview hunk" },
      { "<leader>gb", desc = "Blame" },
      { "<leader>gd", desc = "Diff" },

      -- Debug
      { "<leader>d", group = "debug" },
      { "<leader>db", desc = "Toggle breakpoint" },
      { "<leader>dB", desc = "Conditional breakpoint" },
      { "<leader>dc", desc = "Continue" },
      { "<leader>ds", desc = "Step over" },
      { "<leader>di", desc = "Step into" },
      { "<leader>do", desc = "Step out" },
      { "<leader>dt", desc = "Terminate" },
      { "<leader>dr", desc = "REPL" },
      { "<leader>du", desc = "DAP UI" },

      -- Telescope
      { "<leader>f", group = "find" },
      { "<leader>ff", desc = "Files" },
      { "<leader>fg", desc = "Grep" },
      { "<leader>fb", desc = "Buffers" },
      { "<leader>fh", desc = "Help" },

      -- Terminal
      { "<leader>t", group = "terminal" },
      { "<leader>t", desc = "Horizontal terminal" },
      { "<leader>tv", desc = "Vertical terminal" },
      { "<leader>tf", desc = "Floating terminal" },
      { "<leader>tj", desc = "Move buffer prev" },
      { "<leader>tk", desc = "Move buffer next" },

      -- Buffer
      { "<leader>b", group = "buffer" },
      { "<leader>bc", desc = "Close" },
      { "<leader>bL", desc = "Close left" },
      { "<leader>bR", desc = "Close right" },
      { "<leader>bo", desc = "Only" },

      -- AI / Avante
      { "<leader>a", group = "ai" },
      { "<leader>aa", desc = "Ask" },
      { "<leader>ae", desc = "Edit" },
      { "<leader>ar", desc = "Refresh" },
      { "<leader>at", desc = "Toggle sidebar" },
      { "<leader>ah", desc = "Toggle hint" },
      { "<leader>as", desc = "Toggle suggestion" },
      { "<leader>am", desc = "Toggle repomap" },

      -- Session / REPL
      { "<leader>s", group = "session/repl" },
      { "<leader>ss", desc = "Save session" },
      { "<leader>sr", desc = "REPL" },
      { "<leader>sR", desc = "Restore session" },
      { "<leader>sd", desc = "Delete session" },
      { "<leader>sc", desc = "Send motion" },
      { "<leader>sl", desc = "Send line" },
      { "<leader>sf", desc = "Send file" },
      { "<leader>si", desc = "Interrupt repl" },

      -- Misc
      { "<leader>e", desc = "NvimTree" },
      { "<leader>h", desc = "Prev buffer" },
      { "<leader>l", desc = "Next buffer" },
      { "<leader>mm", desc = "Maximize window" },
      { "<leader>u", desc = "Undotree" },
      { "<leader>vs", desc = "Select venv" },
      { "<leader>nb", desc = "Navbuddy" },
      { "<leader>nn", desc = "Comment toggle" },
      { "<leader>qq", desc = "Close buffer" },
      { "<leader>QQ", desc = "Force quit" },
      { "<leader>qa", desc = "Close all buffers" },
    },
  },
}

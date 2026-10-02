return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { 
      "nvim-tree/nvim-web-devicons",
      "polacekpavel/prompt-yank.nvim",
    },
    config = function()
      -- The corrected bridge function that safely reads file contexts and estimates tokens
      local function yank_marked_files_for_ai()
        local api = require("nvim-tree.api")
        local marks = api.marks.list()

        -- Fallback: If no files are explicitly marked with 'm', grab the file under cursor
        if #marks == 0 then
          local node = api.tree.get_node_under_cursor()
          if node and node.type == "file" and node.absolute_path then
            table.insert(marks, node)
          end
        end

        if #marks > 0 then
          local combined_output = ""
          
          -- Loop over all paths, process via prompt-yank's core action script
          for _, node in ipairs(marks) do
            if node.absolute_path and vim.fn.filereadable(node.absolute_path) == 1 then
              -- Create a temporary, unlisted hidden buffer to read file context cleanly
              local bufnr = vim.fn.bufadd(node.absolute_path)
              vim.fn.bufload(bufnr)
              
              -- Explicitly invoke prompt-yank's backend engine on the buffer
              local status, result = pcall(function()
                return require("prompt-yank.actions").yank({ bufnr = bufnr })
              end)
              
              if status and type(result) == "string" then
                combined_output = combined_output .. result .. "\n\n"
              else
                -- Fallback: If prompt-yank's API function signature changes, generate markdown manually
                local relative_path = vim.fn.fnamemodify(node.absolute_path, ":.")
                local extension = vim.fn.fnamemodify(node.absolute_path, ":e")
                local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
                local content = table.concat(lines, "\n")
                
                combined_output = combined_output .. "### File: `" .. relative_path .. "`\n```" .. extension .. "\n" .. content .. "\n```\n\n"
              end
            end
          end

          -- Copy the completed context block cleanly to your system clipboard
          vim.fn.setreg("+", combined_output)
          
          -- --- TOKEN ESTIMATION LOGIC ---
          -- Using a standard LLM metric: 1 token is roughly 3.5 characters for source code
          local char_count = string.len(combined_output)
          local token_estimate = math.floor(char_count / 3.5)
          
          -- Format the token number with commas for readability (e.g., 1,250 instead of 1250)
          local formatted_tokens = tostring(token_estimate):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
          -- ------------------------------

          -- Clear marks automatically after copying so your list is fresh for next time
          api.marks.clear()
          api.tree.reload() -- refresh tree UI state
          
          print(string.format("✅ Copied %d file(s) to clipboard for AI (~%s tokens!)", #marks, formatted_tokens))
        else
          print("⚠️ No valid files selected.")
        end
      end

      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 25,
        },
        renderer = {
          group_empty = true,
          indent_width = 2,
          indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
            },
          },
        },
        filters = {
          dotfiles = false,
        },
        on_attach = function(bufnr)
          local api = require("nvim-tree.api")
          local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
          end

          api.config.mappings.default_on_attach(bufnr)

          -- Your current custom mappings
          vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
          vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
          vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))

          -- New AI Context mapping bound to 'y'
          vim.keymap.set("n", "y", yank_marked_files_for_ai, opts("Yank marked files for AI Context"))
        end,
      })

      -- Your custom highlight rules preserved below
      vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#585b70" })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("NvimTreeFixHighlight", { clear = true }),
        callback = function()
          vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#585b70" })
          vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#444b5d", bg = "NONE" })
        end,
      })
    end,
  }
}


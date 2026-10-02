return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        python = { "black" },
        rust = { "rustfmt" },
        html = { "prettier", stop_after_first = true },

        -- Vue & frontend development:
        vue = { "prettierd", "prettier", stop_after_first = true },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
      },
    })

    -- Store active timers for each buffer
    local timers = {}

    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Format buffer 10 seconds after save",
      group = vim.api.nvim_create_augroup("ConformDelayedFormat", { clear = true }),
      callback = function(args)
        local bufnr = args.buf

        -- Reset existing timer if a new autosave happened within the 10s window
        if timers[bufnr] then
          timers[bufnr]:stop()
          timers[bufnr]:close()
          timers[bufnr] = nil
        end

        local timer = vim.uv.new_timer()
        timers[bufnr] = timer

        timer:start(
          5000, -- 10 seconds delay
          0,
          vim.schedule_wrap(function()
            -- Clean up the timer reference
            if timers[bufnr] then
              timers[bufnr]:stop()
              timers[bufnr]:close()
              timers[bufnr] = nil
            end

            -- Ensure buffer is still valid and loaded before formatting
            if vim.api.nvim_buf_is_valid(bufnr) and vim.api.nvim_buf_is_loaded(bufnr) then
              conform.format({
                bufnr = bufnr,
                async = true,
                lsp_fallback = true,
              }, function()
                -- Automatically save the changes made by the formatter
                if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].modified then
                  vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd("silent! update")
                  end)
                end
              end)
            end
          end)
        )
      end,
    })
  end,
}

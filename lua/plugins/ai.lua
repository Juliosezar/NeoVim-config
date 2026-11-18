return {
  "cursortab/cursortab.nvim",
  lazy = false,
  build = "cd server && go build",
  config = function()
    local trigger_key = "<F13>" -- unused key so it doesn't clash with anything

    require("cursortab").setup({
      enabled = true,
      keymaps = {
        accept = "<Tab>",
        partial_accept = "<S-Tab>",
        trigger = trigger_key,
      },
      behavior = {
        enabled_modes = { "normal" },
        idle_completion_delay = -1, -- disable auto-trigger on idle
        text_change_debounce = -1,  -- disable auto-trigger on text changes
      },
      provider = {
        type = "sweep",
        url = "http://localhost:8877",
      },
    })

    vim.api.nvim_create_autocmd("InsertLeave", {
      group = vim.api.nvim_create_augroup("CursortabOnInsertLeave", { clear = true }),
      callback = function()
        vim.schedule(function()
          if vim.api.nvim_get_mode().mode == "n" then
            local key = vim.api.nvim_replace_termcodes(trigger_key, true, false, true)
            vim.api.nvim_feedkeys(key, "m", false)
          end
        end)
      end,
    })
  end,
}

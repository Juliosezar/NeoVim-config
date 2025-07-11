return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- load only when Neovim starts with no files
  cmd = "Alpha",
  init = function()
    -- if Neovim was launched with no files, set up Alpha
    if vim.fn.argc() == 0 then
      require("alpha").setup(require("alpha.themes.dashboard").opts)
      -- automatically open Alpha on startup
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("Alpha")
        end,
      })
    end
  end,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
'   ░▒▓███████▓▒░ ░▒▓████████▓▒░ ░▒▓████████▓▒░  ░▒▓██████▓▒░  ░▒▓███████▓▒░ ',
'  ░▒▓█▓▒░        ░▒▓█▓▒░               ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ',
'  ░▒▓█▓▒░        ░▒▓█▓▒░             ░▒▓██▓▒░  ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ',
'   ░▒▓██████▓▒░  ░▒▓██████▓▒░      ░▒▓██▓▒░    ░▒▓████████▓▒░ ░▒▓███████▓▒░  ',
'         ░▒▓█▓▒░ ░▒▓█▓▒░         ░▒▓██▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ',
'         ░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ',
'  ░▒▓███████▓▒░  ░▒▓████████▓▒░ ░▒▓████████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ',
'',
'',
'',
'',
'',
'',
'',
'',
'',}

    dashboard.section.buttons.val = {
  dashboard.button("e", "📄  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "🔍  Find file", ":Telescope find_files<CR>"),
  dashboard.button("w", "🔎  Find word", ":Telescope live_grep<CR>"),
  dashboard.button("s", "💾  Restore session", ":lua require('persistence').load()<CR>"),
  dashboard.button("r", "🕘  Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("q", "❌  Quit", ":qa<CR>"),
}


    dashboard.section.footer.val = "Python / Rust Programmer"

    alpha.setup(dashboard.opts)
  end,
}

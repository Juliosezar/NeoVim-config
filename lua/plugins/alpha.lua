return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- for icons
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

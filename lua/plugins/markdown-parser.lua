return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 
    'nvim-treesitter/nvim-treesitter', 
    'nvim-tree/nvim-web-devicons' -- or 'echasnovski/mini.icons'
  },
  ft = { 'markdown' }, -- lazy load automatically when opening a markdown file
  opts = {
    heading = {
      enabled = true,
      sign = true,
      icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    },
    code = {
      enabled = true,
      sign = false,
      style = 'full',
    },
    checkbox = {
      enabled = true,
    },
  },
}

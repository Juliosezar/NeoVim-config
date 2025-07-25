return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false,      -- show dotfiles like .gitignore and .env
      },
      git = {
        enable = true,
        ignore = false,        -- show files ignored by Git (e.g. .env)
        timeout = 500,
      },
    })
  end
}


-- lua/plugins/nvim-tree.lua
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional but recommended
  },
  config = function()
    -- Setup NvimTree
    require("nvim-tree").setup({})
  end
}


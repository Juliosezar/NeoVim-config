-- lazy.nvim plugin list
return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      groups = { -- additional groups you may want to clear
        "Normal", "NormalNC", "NvimTreeNormal", "NvimTreeNormalNC", "NvimTreeEndOfBuffer",
        "NvimTreeVertSplit", "VertSplit"
      },
      extra_groups = {}, -- also clear this if needed
      exclude_groups = {}, -- don't exclude anything
    })
  end,
}

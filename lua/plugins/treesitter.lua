-- return {
-- 	"nvim-treesitter/nvim-treesitter",
-- 	build = ":TSUpdate",
-- 	config = function()
-- 		local config = require("nvim-treesitter.configs")
-- 		config.setup({
-- 			auto_install = true,
-- 			highlight = { enable = true },
-- 			indent = { enable = true },
-- 		})
-- 	end,
-- }
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
	auto_install = true,
      ensure_installed = { "python", "rust", "html", "css", "javascript", "lua" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}


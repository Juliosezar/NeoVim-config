return {
  "camAtGitHub/pydochide.nvim",
  ft = "python", -- load only for Python files
  config = function()
    -- Automatically hide docstrings when opening Python files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "python",
      command = "PyDocHide",
    })
  end,
}


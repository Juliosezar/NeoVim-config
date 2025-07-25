return {
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "rust_analyzer",
	"ruff",
        "jedi_language_server",
        "html",
        "cssls",
        "tsserver",
      },
    })

    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    local function get_python_path(workspace)
      local venv_path = vim.fn.findfile("pyvenv.cfg", workspace .. "/.venv")
      if venv_path ~= "" then
        return workspace .. "/.venv/bin/python"
      end
      return vim.fn.exepath("python3")
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.pyright.setup({
      capabilities = capabilities,
      before_init = function(_, config)
        local root_dir = util.root_pattern("manage.py", ".git")(vim.fn.getcwd()) or vim.fn.getcwd()
        config.settings = {
          python = {
            pythonPath = get_python_path(root_dir),
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        }
      end,
    })

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
    })

    lspconfig.ruff.setup({})

    lspconfig.html.setup({
      capabilities = capabilities,
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    lspconfig.tsserver.setup({
      capabilities = capabilities,
    })
  end,
}


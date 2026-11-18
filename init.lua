-- ============================================================================
-- Options
-- ============================================================================
local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.fillchars:append({ vert = "│" })
opt.guicursor = "v-c-sm-i-ci-ve-r-cr-o:ver25"

opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- ============================================================================
-- Plugin Manager (lazy.nvim)
-- ============================================================================
require("config.lazy")

-- ============================================================================
-- Theme & Highlights
-- ============================================================================



-- ============================================================================
-- Keymaps
-- ============================================================================
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Escape shortcuts
keymap("i", "jk", "<Esc>")
keymap("i", "jj", "<Esc>")
keymap("v", "jk", "<Esc>")
keymap("t", "jj", [[<C-\><C-n>]], opts)

-- Diagnostics
keymap("n", "<leader>rl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
keymap("n", "<leader>rd", vim.diagnostic.setloclist, { desc = "Diagnostic list" })

-- Comments (Neovim built-in)
keymap("n", "<leader>co", "gcc", { remap = true, desc = "Comment toggle current line" })
keymap("x", "<leader>co", "gc", { remap = true, desc = "Comment toggle visual selection" })

-- NvimTree
keymap("n", "<leader>e", function()
  local nvim_tree = require("nvim-tree.api")
  if nvim_tree.tree.is_visible() then
    nvim_tree.tree.focus()
  else
    nvim_tree.tree.open()
  end
end, { desc = "Focus/Open Nvim-tree" })

-- Splits & window navigation
keymap("n", "<leader>wv", "<C-w>v", opts)
keymap("n", "<leader>ws", "<C-w>s", opts)
keymap("n", "<leader><leader>h", "<C-w>h", opts)
keymap("n", "<leader><leader>l", "<C-w>l", opts)
keymap("n", "<leader><leader>j", "<C-w>j", opts)
keymap("n", "<leader><leader>k", "<C-w>k", opts)
keymap("n", "<leader>wd", "<C-w>q", opts)
keymap("n", "<leader>wc", "<C-w>c", opts)

-- Window resize
keymap("n", "<leader>w=", "<C-w>=", opts)
keymap("n", "<leader>w_", "<C-w>_", opts)
keymap("n", "<leader>w|", "<C-w>|", opts)
keymap("n", "<leader>r<Up>", ":resize +4<CR>", opts)
keymap("n", "<leader>r<Down>", ":resize -4<CR>", opts)
keymap("n", "<leader>r<Right>", ":vertical resize +4<CR>", opts)
keymap("n", "<leader>r<Left>", ":vertical resize -4<CR>", opts)

-- Terminals
keymap("n", "<leader>t", function()
  vim.cmd("split | terminal")
end, { noremap = true, silent = true, desc = "Open terminal in horizontal split" })

keymap("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal")
end, { noremap = true, silent = true, desc = "Open terminal in vertical split" })

-- Save & quit
keymap("n", "<leader>ww", ":w<CR>", opts)
keymap("n", "<leader>wq", ":wq<CR>", opts)
keymap("n", "<leader>QQ", ":q!<CR>", opts)

keymap("n", "<leader>qq", function()
  local bufs = vim.tbl_filter(function(b)
    return vim.api.nvim_buf_is_valid(b) and vim.fn.buflisted(b) == 1
  end, vim.api.nvim_list_bufs())

  local cur = vim.api.nvim_get_current_buf()

  if #bufs <= 1 then
    if vim.bo[cur].buftype == "terminal" then
      vim.cmd("bd! " .. cur)
      vim.cmd("qa")
    else
      vim.cmd("confirm qa")
    end
  else
    vim.cmd("bp")
    local target = vim.fn.bufnr("#")
    if target ~= -1 and vim.api.nvim_buf_is_valid(target) then
      if vim.bo[target].buftype == "terminal" then
        vim.cmd("bd! " .. target)
      else
        vim.cmd("confirm bd " .. target)
      end
    end
  end
end, { desc = "Close buffer or exit Neovim if last" })

keymap("n", "<leader>qa", function()
  vim.cmd("bufdo bd")
  vim.cmd("qa")
end, { desc = "Close all buffers and quit Neovim" })

-- Copy project tree
local function copy_project_tree()
  local handle_git = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
  local is_git = handle_git and handle_git:read("*a"):match("true")
  if handle_git then
    handle_git:close()
  end

  local cmd
  if is_git then
    cmd = [[
      (
        git ls-files --cached --others --exclude-standard --directory --full-name | sed 's|^|./|';
        find . -type d -not -path '*/.*' -not -path '*/node_modules*' | while read -r dir; do
          if ! git check-ignore -q "$dir"; then echo "$dir"; fi
        done;
        find . -name ".env*" -not -path "*/node_modules/*"
      ) | sort -u | tree --fromfile .
    ]]
  else
    cmd = "tree -I 'node_modules|.git' -a"
  end

  local result = vim.fn.system(cmd)
  if result ~= "" then
    vim.fn.setreg("+", result)
    vim.notify("Project tree copied (with empty dirs & .env)", vim.log.levels.INFO)
  else
    vim.notify("Error: 'tree' failed. Make sure 'tree' is installed.", vim.log.levels.ERROR)
  end
end

keymap("n", "<leader>cp", copy_project_tree, { desc = "Copy Project Tree" })

-- undo
vim.cmd.packadd("nvim.undotree")
vim.keymap.set("n", "<leader>u", "<cmd>Undotree<CR>", { desc = "Toggle UndoTree" })

-- ============================================================================
-- Autocmds & Compatibility Shims
-- ============================================================================
-- Native 0.12 UI2 (floating/inline messages, highlighted cmdline, scrollable pager)
vim.o.cmdheight = 0 -- optional: hides the bottom cmdline when idle
require("vim._core.ui2").enable({
  enable = true,
  msg = {
    targets = "msg", -- or omit `targets` to use Neovim's defaults (cmd/msg/pager split)
    msg = { height = 0.3, timeout = 4000 },
    pager = { height = 0.5 },
  },
})
--
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    if vim.fn.argc() == 0 then
      vim.schedule(function()
        require("alpha").start()
      end)
    end
  end,
})

local sweep_group = vim.api.nvim_create_augroup("SweepLlamaAuto", { clear = true })
local sync_cmd = vim.fn.expand("~/.local/bin/sweep-llama-sync")

vim.api.nvim_create_autocmd("VimEnter", {
  group = sweep_group,
  callback = function()
    vim.fn.jobstart({ sync_cmd }, { detach = true })
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  group = sweep_group,
  callback = function()
    vim.fn.jobstart({ "sh", "-c", "sleep 0.5 && " .. vim.fn.shellescape(sync_cmd) }, { detach = true })
  end,
})

-- Silence deprecation warning from older plugins (e.g. nvim-navbuddy)
vim.lsp.get_buffers_by_client_id = function(client_id)
  local bufs = {}
  for _, client in ipairs(vim.lsp.get_clients({ id = client_id })) do
    for _, buf in ipairs(client.attached_buffers or {}) do
      table.insert(bufs, buf)
    end
  end
  return bufs
end

require("config.lazy")
require("mason").setup()
require("config.cmp")
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "rust_analyzer" },
})

-- Add this to your init.lua or config file
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Get all buffer numbers
    local buffers = vim.api.nvim_list_bufs()
    
    for _, buf in ipairs(buffers) do
      -- Skip unloaded buffers
      if vim.api.nvim_buf_is_loaded(buf) then
        local buf_name = vim.api.nvim_buf_get_name(buf)
        
        -- Check if buffer name contains "NVIMTREE" (case insensitive)
        if buf_name:upper():find("NvimTree") then
          -- Forcefully wipe out the buffer
          vim.cmd("silent! bwipeout " .. buf)
        end
      end
    end
    
    -- Optional: Notify how many buffers were cleaned
    print("Cleaned up NVIMTREE buffers on startup")
  end,
  once = true,  -- Only run once on startup
})

vim.g.catppuccin_flavour = "mocha"
vim.cmd.colorscheme "catppuccin"
-- Set transparent background (works with most themes)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.o.number = true
vim.o.relativenumber = true

-- Exit insert mode by typing 'jk'
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "jj", "<Esc>")


-- Exit visual mode with 'jk'
vim.keymap.set("v", "jk", "<Esc>")

-- neotree
-- Disable netrw (strongly recommended)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup with options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false, -- Show hidden files
  },
})

-- Keybindings
vim.keymap.set("n", "<leader>e", function()
  local nvim_tree = require("nvim-tree.api")
  if nvim_tree.tree.is_visible() then
    nvim_tree.tree.focus()  -- Focus if already open
  else
    nvim_tree.tree.open()   -- Open if closed
  end
end, { desc = "Focus/Open Nvim-tree" })

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set cursor to bar in Insert mode, block in Normal mode
vim.o.guicursor = "v-c-sm-i-ci-ve-r-cr-o:ver25"

	
-- Splits
keymap('n', '<leader>wv', '<C-w>v', opts) -- vertical split
keymap('n', '<leader>ws', '<C-w>s', opts) -- horizontal split

-- Movement
keymap('n', '<leader><leader>h', '<C-w>h', opts)
keymap('n', '<leader><leader>l', '<C-w>l', opts)
keymap('n', '<leader><leader>j', '<C-w>j', opts)
keymap('n', '<leader><leader>k', '<C-w>k', opts)

-- Close/Quit
keymap('n', '<leader>wq', '<C-w>q', opts)
keymap('n', '<leader>wc', '<C-w>c', opts)

-- Resize
keymap('n', '<leader>w=', '<C-w>=', opts) -- equal size
keymap('n', '<leader>w_', '<C-w>_', opts) -- max height
keymap('n', '<leader>w|', '<C-w>|', opts) -- max width


-- Resize height
--
keymap('n', '<leader>r<Up>', ':resize +4<CR>', opts)     -- taller
keymap('n', '<leader>r<Down>', ':resize -4<CR>', opts)   -- shorter

-- Resize width
keymap('n', '<leader>r<Right>', ':vertical resize +4<CR>', opts)  -- wider
keymap('n', '<leader>r<Left>', ':vertical resize -4<CR>', opts)   -- narrower


vim.keymap.set('n', '<leader>t', function()
  vim.cmd("split | terminal")
end, { noremap = true, silent = true, desc = "Open terminal in horizontal split" })
vim.keymap.set('n', '<leader>tv', function()
  vim.cmd("vsplit | terminal")
end, { noremap = true, silent = true, desc = "Open terminal in vertical split" })


-- Save
keymap('n', '<leader>ww', ':w<CR>', opts)     -- Save file
-- Quit
keymap('n', '<leader>qq', ':q<CR>', opts)     -- Quit window
-- Save and Quit
keymap('n', '<leader>wq', ':wq<CR>', opts)    -- Save and quit
-- force quit
keymap('n', '<leader>QQ', ':q!<CR>', opts)      -- Force quit

-- Make <Esc> exit terminal mode
vim.keymap.set('t', 'jj', [[<C-\><C-n>]], opts)


local opts = { noremap = true, silent = true }

-- General Rust/Cargo commands
vim.keymap.set("n", "<leader>cb", ":CargoBuild<CR>", opts)          -- Build
vim.keymap.set("n", "<leader>cr", ":CargoRunTerm<CR>", opts)            -- Run
vim.keymap.set("n", "<leader>ct", ":CargoTest<CR>", opts)           -- Test
vim.keymap.set("n", "<leader>cc", ":CargoCheck<CR>", opts)          -- Check
vim.keymap.set("n", "<leader>cl", ":CargoClippy<CR>", opts)         -- Clippy
vim.keymap.set("n", "<leader>cf", ":CargoFmt<CR>", opts)            -- Format
vim.keymap.set("n", "<leader>cu", ":CargoUpdate<CR>", opts)         -- Update
vim.keymap.set("n", "<leader>cd", ":CargoDoc<CR>", opts)            -- Generate docs
vim.keymap.set("n", "<leader>cx", ":CargoClean<CR>", opts)          -- Clean

-- Interactive commands (e.g., add/remove dependencies)
vim.keymap.set("n", "<leader>ca", ":CargoAdd<CR>", opts)            -- Add dependency
vim.keymap.set("n", "<leader>crm", ":CargoRemove<CR>", opts)        -- Remove dependency
vim.keymap.set("n", "<leader>cn", ":CargoNew<CR>", opts)            -- Create new project

-- Key mapping for selected yank <---> clipboard
-- Yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line
-- Delete into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>d', '"+d') -- delete motion
vim.keymap.set({'n', 'v'}, '<leader>D', '"+D') -- delete line
-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')  -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P')  -- paste before cursor

-- SPLITS
-- Map the key combination <leader>vs to split the current file vertically
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit %<CR>', { noremap = true, silent = true })
-- Map the key combination <leader>cs to close the current split
vim.api.nvim_set_keymap('n', '<leader>cs', ':close<CR>', { noremap = true, silent = true })
-- Switch to the split to the left (Ctrl + h,l,k,j)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- Switch to the split to the right
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- Switch to the split above
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- Switch to the split below
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- Switch to maximized and back
vim.api.nvim_set_keymap('n', '<leader>m', '<C-w>|', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', '<C-w>=', { noremap = true, silent = true })


-- Call simple resize function
vim.api.nvim_set_keymap('n', '<leader>rv', '<cmd>lua ResizeVertical()<cr>', { noremap = true, silent = true })


-- Key mapping for opening and closing the NvimTree file explorer
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Key mappings for switching between open buffers
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })

-- Key mapping for saving the current buffer
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })

-- Key mapping for searching with Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })

-- Key mappings for navigating windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Key mapping for toggling the terminal
vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<cr>', { noremap = true })

-- Key mapping for quickly quitting Neovim
vim.keymap.set('n', '<leader>q', ':q<CR>', { noremap = true })

-- Key mapping for easy navigation between tabs
vim.keymap.set("n", "<S-A-Right>", '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<S-A-Left>", '<Cmd>BufferNext<CR>', { noremap = true, silent = true })

-- Key mapping to toggle nvim-tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
-- switch between tree and file view via Strg & Arrow
vim.keymap.set("n", "<C-Right>", '<c-w>l', { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", '<c-w>h', { noremap = true, silent = true })

-- Key mappings for lazygit
vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- Moving highlightet text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- LSP
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

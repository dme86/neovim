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
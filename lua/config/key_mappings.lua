-- Key mapping for selected yank <---> clipboard
-- Yank into system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y') -- yank motion
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y') -- yank line
-- Delete into system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d') -- delete motion
vim.keymap.set({ 'n', 'v' }, '<leader>D', '"+D') -- delete line
-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')        -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P')        -- paste before cursor

-- Define a normal mode mapping for the `ß` 
vim.api.nvim_set_keymap('n', 'ß', '`', { noremap = true })

-- jump back to last file (buffer) via backspace
vim.api.nvim_set_keymap('n', '<bs>', '<c-^>', { silent = true, noremap = true })

-- Map J to PageDown
vim.api.nvim_set_keymap('n', 'J', '<PageDown>', { noremap = true, silent = true })
-- Map K to PageUp
vim.api.nvim_set_keymap('n', 'K', '<PageUp>', { noremap = true, silent = true })
-- Map Z to zz (center the cursor line)
vim.api.nvim_set_keymap('n', 'Z', 'zz', { noremap = true, silent = true })

-- Toggle ZenMode
vim.api.nvim_set_keymap('n', '<leader>zm', ':ZenMode<CR>', { noremap = true, silent = true })

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

-- Key mapping for saving, closing and save+close the current buffer
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>x', ':x<CR>', { noremap = true, silent = true })

-- Key mappings for navigating windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Moving highlightet text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Key mapping for searching with Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })

-- global settings
vim.g.mapleader = ","
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.hlsearch = true
opt.incsearch = true
opt.updatetime = 100
opt.cursorline = true
opt.showmode = false
opt.shiftwidth = 2
opt.smartindent = true
vim.cmd('colorscheme gruvbox')


-- Find files using Telescope command-line sugar.
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true})
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true})

-- barbar
-- switch between tabs via Shift+Alt & Arrow
vim.keymap.set("n", "<S-A-Right>", '<Cmd>BufferPrevious<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<S-A-Left>", '<Cmd>BufferNext<CR>', { noremap = true, silent = true })

-- undootree
vim.keymap.set('n', '<C-u>', ':UndotreeToggle<CR>')

-- comments (visual: gc -> linewise comment; gb -> blockwise comment)
require('Comment').setup()

-- tree settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
-- switch between tree and file view via Strg & Arrow
vim.keymap.set("n", "<C-Right>", '<c-w>l', { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", '<c-w>h', { noremap = true, silent = true })

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- toggleterm / toggle via Shift + Alt + t
require'toggleterm'.setup {
  open_mapping = [[<S-c-t>]],
  shade_terminals = false,
  close_on_exit = true,
  direction = 'float',
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '???', right = '???'},
    section_separators = { left = '???', right = '???'},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require("neo-tree").setup({
  popup_border_style = "rounded",
  enable_git_status = true,
})
-- Key mapping for opening and closing the Neotree file explorer
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })

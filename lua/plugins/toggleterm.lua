return {
  -- toggleterm
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    -- Set up the key mapping for ToggleTerm
    vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm<cr>', { noremap = true, silent = true })

    -- Set up ToggleTerm options
    require("toggleterm").setup({
      open_mapping = [[<S-c-t]],
      shade_terminals = false,
      close_on_exit = true,
      direction = 'float',
      float_opts = {
        border = "curved", -- single | double | curved
        winblend = 0,
      },
      persist_mode = true,
      highlights = {
        FloatBorder = {
          guifg = "#059de3",
        },
      },
    })

    -- LazyGit setup
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    -- Function to toggle LazyGit terminal
    function _lazygit_toggle()
      lazygit:toggle()
    end

    -- Set up the key mapping for LazyGit
    vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  end,
}


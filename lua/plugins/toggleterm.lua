return {
  -- toggleterm
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal

    local function project_session_name()
      local cwd = vim.fn.getcwd()
      local root = vim.fs.root(cwd, { '.git', 'Cargo.toml', 'go.mod', 'package.json' }) or cwd
      local home = vim.fs.normalize(vim.env.HOME or "")
      local normalized = vim.fs.normalize(root)
      if home ~= "" and normalized:sub(1, #home) == home then
        normalized = "~" .. normalized:sub(#home + 1)
      end
      return (normalized:gsub('[^%w_%-~]', '_'))
    end

    local function project_tmux_cmd()
      return "tmux new-session -A -s " .. project_session_name()
    end

    require("toggleterm").setup({
      insert_mappings = false,
      terminal_mappings = false,
      shade_terminals = false,
      close_on_exit = false,
      start_in_insert = true,
      direction = 'float',
      float_opts = {
        border = "curved",
        winblend = 0,
        title = " dme :: popup terminal ",
        title_pos = "center",
      },
      persist_mode = false,
      highlights = {
        FloatBorder = {
          guifg = "#d79921",
        },
      },
    })

    local project_tmux = Terminal:new({
      cmd = project_tmux_cmd(),
      display_name = "dme :: popup terminal",
      hidden = true,
      close_on_exit = false,
      direction = 'float',
      dir = 'git_dir',
      on_open = function()
        vim.cmd("startinsert")
      end,
    })

    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _project_tmux_toggle()
      project_tmux.cmd = project_tmux_cmd()
      project_tmux.dir = vim.fs.root(vim.fn.getcwd(), { '.git' }) or vim.fn.getcwd()
      project_tmux:toggle()
    end

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set('n', '<C-t>', function()
      _project_tmux_toggle()
    end, { noremap = true, silent = true, desc = 'Toggle project tmux terminal' })

    vim.keymap.set('t', '<C-t>', [[<C-\><C-n><Cmd>lua _project_tmux_toggle()<CR>]], {
      noremap = true,
      silent = true,
      desc = 'Toggle project tmux terminal',
    })

    vim.keymap.set('n', '<leader>t', function()
      _project_tmux_toggle()
    end, { noremap = true, silent = true, desc = 'Toggle project tmux terminal' })

    vim.keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
  end,
}

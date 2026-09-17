return {
  -- toggleterm
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local Terminal = require('toggleterm.terminal').Terminal

    local function project_session_name(root)
      local home = vim.fs.normalize(vim.env.HOME or "")
      local normalized = vim.fs.normalize(root)
      if home ~= "" and (normalized == home or normalized:sub(1, #home + 1) == home .. "/") then
        normalized = "~" .. normalized:sub(#home + 1)
      end
      return (normalized:gsub('[^%w_%-~]', '_')) .. "_" .. vim.fn.sha256(root):sub(1, 12)
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

    local project_terminals = {}
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

    function _project_tmux_toggle()
      -- Close the current project terminal even if :cd changed while it was open.
      for _, terminal in pairs(project_terminals) do
        if terminal:is_open() then
          terminal:close()
          return
        end
      end
      if vim.fn.executable('tmux') == 0 then
        vim.notify('tmux is not installed', vim.log.levels.ERROR)
        return
      end
      local cwd = vim.fn.getcwd()
      local root = vim.fs.normalize(vim.fs.root(cwd, { '.git', 'Cargo.toml', 'go.mod', 'package.json' }) or cwd)
      local terminal = project_terminals[root]
      if not terminal or (terminal.job_id and vim.fn.jobwait({ terminal.job_id }, 0)[1] ~= -1) then
        terminal = Terminal:new({
          cmd = 'tmux new-session -A -s ' .. vim.fn.shellescape(project_session_name(root))
            .. ' -c ' .. vim.fn.shellescape(root),
          display_name = 'dme :: popup terminal',
          hidden = true,
          close_on_exit = true,
          direction = 'float',
          dir = root,
          on_open = function() vim.cmd('startinsert') end,
        })
        project_terminals[root] = terminal
      end
      terminal:toggle()
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

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {

	        header = {
          '      _                ',
          '     | |               ',
          '   __| |_ __ ___   ___ ',
          '  / _` | \'_ ` _ \\ / _ \\',
          ' | (_| | | | | | |  __/',
          '  \\__,_|_| |_| |_|\\___|',
          '                       ',
          '                       ',
        },
      week_header = {
       enable = false,
      },
      shortcut = {
        { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          icon_hl = '@variable',
          desc = 'Files',
          group = 'Label',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          desc = ' Apps',
          group = 'DiagnosticHint',
          action = 'Telescope app',
          key = 'a',
        },
        {
          desc = ' dotfiles',
          group = 'Number',
          action = 'Telescope dotfiles',
          key = 'd',
        },      -- config
    },
  }
}
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

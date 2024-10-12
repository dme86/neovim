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
      -- config
    },
  }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

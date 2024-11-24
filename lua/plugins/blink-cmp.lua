return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  version = 'v0.6.1', -- use a release tag to download pre-built binaries
  opts = {
    nerd_font_variant = 'mono',

    accept = { auto_brackets = { enabled = true } },
    trigger = { signature_help = { enabled = true } },

      keymap = {
        preset = 'default', -- Verwende ein Preset für Tastenkombinationen
        mappings = {
          ['<C-space>'] = 'show',
          ['<C-e>'] = 'hide',
          ['<C-CR>'] = 'accept',
        },
      },

    windows = {
      autocomplete = {
        min_width = 20,
        max_width = 40,
        max_height = 15,
        border = 'rounded',
        scrolloff = 2,
        direction_priority = { 's', 'n' },
      },
      documentation = {
        min_width = 15,
        max_width = 50,
        max_height = 20,
	auto_show = true,
        border = 'rounded',
        direction_priority = {
          autocomplete_north = { 'e', 'w', 'n', 's' },
          autocomplete_south = { 'e', 'w', 's', 'n' },
        },
      },
    },
  },
}

return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.7.3',

  opts = {
    keymap = {
      preset = 'super-tab',
      mappings = {
        ['<C-space>'] = 'show',
        ['<C-e>'] = 'hide',
      },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    sources = {
      completion = {
        enabled_providers = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },

    completion = {
      accept = {
        auto_brackets = { enabled = true },
      },

      -- 'menu' controls the main completion window
      menu = {
        auto_show = true,
        border = 'rounded', -- set a rounded border here
        min_width = 20,
        max_width = 40,
        max_height = 15,
        winblend = 0,
        winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
        scrollbar = false,
        direction_priority = { 's', 'n' },
        scrolloff = 2,
      },

      -- 'documentation' controls the documentation window for completion items
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500,
        update_delay_ms = 50,
        treesitter_highlighting = true,
        window = {
          min_width = 10,
          max_width = 60,
          max_height = 20,
          border = 'rounded', -- set a rounded border for documentation
          winblend = 0,
          winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
          scrollbar = true,
          direction_priority = {
            menu_north = { 'e', 'w', 'n', 's' },
            menu_south = { 'e', 'w', 's', 'n' },
          },
        },
      },
    },

    signature = {
      enabled = true,
      window = {
        min_width = 20,
        max_width = 40,
        max_height = 15,
        border = 'rounded', -- set a rounded border for the signature help window
        winblend = 0,
        winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
        scrollbar = false,
        direction_priority = { 'n', 's' },
        treesitter_highlighting = true,
      },
    },
  },

  opts_extend = { "sources.completion.enabled_providers" },
}


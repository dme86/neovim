return {
  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',



    opts = {
      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal',

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } }, -- Missing comma added here

      -- experimental signature help support
      trigger = { signature_help = { enabled = true } },

      -- key mappings
      keymap = {
	show = '<C-space>',
	hide = '<C-e>',
	accept = '<CR>', -- Enter key
	select_prev = '<C-k>', -- Ctrl+k
	select_next = '<C-j>', -- Ctrl+j
      },

      kind_icons = {
	Text = '󰉿',
	Method = '󰊕',
	Function = '󰊕',
	Constructor = '󰒓',

	Field = '󰜢',
	Variable = '󰆦',
	Property = '󰖷',

	Class = '󱡠',
	Interface = '󱡠',
	Struct = '󱡠',
	Module = '󰅩',

	Unit = '󰪚',
	Value = '󰦨',
	Enum = '󰦨',
	EnumMember = '󰦨',

	Keyword = '󰻾',
	Constant = '󰏿',

	Snippet = '󱄽',
	Color = '󰏘',
	File = '󰈔',
	Reference = '󰬲',
	Folder = '󰉋',
	Event = '󱐋',
	Operator = '󰪚',
	TypeParameter = '󰬛',
      },

  sources = {
    -- similar to nvim-cmp's sources, but we point directly to the source's lua module
    -- multiple groups can be provided, where it'll fallback to the next group if the previous
    -- returns no completion items
    -- WARN: This API will have breaking changes during the beta
    providers = {
      {
        { 'blink.cmp.sources.lsp' },
        { 'blink.cmp.sources.path' },
        { 'blink.cmp.sources.snippets', score_offset = -3 },
      },
      { { 'blink.cmp.sources.buffer' } },
    },
    -- FOR REF: full example
    providers = {
      { 
        -- all of these properties work on every source
        {
            'blink.cmp.sources.lsp',
            keyword_length = 0,
            score_offset = 0,
            trigger_characters = { 'f', 'o', 'o' },
            opts = {},
        },
        -- the follow two sources have additional options
        {
          'blink.cmp.sources.path', 
          opts = {
            trailing_slash = false,
            label_trailing_slash = true,
            get_cwd = function(context) return vim.fn.expand(('#%d:p:h'):format(context.bufnr)) end,
            show_hidden_files_by_default = true,
          }
        },
        {
          'blink.cmp.sources.snippets',
          score_offset = -3,
          -- similar to https://github.com/garymjr/nvim-snippets
          opts = {
            friendly_snippets = true,
            search_paths = { vim.fn.stdpath('config') .. '/snippets' },
            global_snippets = { 'all' },
            extended_filetypes = {},
            ignored_filetypes = {},
          },
        },
      },
      { { 'blink.cmp.sources.buffer' } }
    }
  },


      windows = {
	autocomplete = {
	min_width = 30,
	max_width = 60,
	max_height = 10,
	border = 'none',
	winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
	-- keep the cursor X lines away from the top/bottom of the window
	scrolloff = 2,
	-- which directions to show the window,
	-- falling back to the next direction when there's not enough space
	direction_priority = { 's', 'n' },
	-- Controls how the completion items are rendered on the popup window
	-- 'simple' will render the item's kind icon the left alongside the label
	-- 'reversed' will render the label on the left and the kind icon + name on the right
	-- 'function(blink.cmp.CompletionRenderContext): blink.cmp.Component[]' for custom rendering
	draw = 'simple',
	-- Controls the cycling behavior when reaching the beginning or end of the completion list.
	cycle = {
	  -- When `true`, calling `select_next` at the *bottom* of the completion list will select the *first* completion item.
	  from_bottom = true,
	  -- When `true`, calling `select_prev` at the *top* of the completion list will select the *last* completion item.
	  from_top = true
      },
    },
      documentation = {
	min_width = 10,
	max_width = 60,
	max_height = 20,
	border = 'padded',
	winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None',
	-- which directions to show the documentation window,
	-- for each of the possible autocomplete window directions,
	-- falling back to the next direction when there's not enough space
	direction_priority = {
	  autocomplete_north = { 'e', 'w', 'n', 's' },
	  autocomplete_south = { 'e', 'w', 's', 'n' },
	},
	auto_show = true,
	auto_show_delay_ms = 500,
	update_delay_ms = 100,
      },
    signature_help = {
      min_width = 1,
      max_width = 100,
      max_height = 10,
      border = 'padded',
      winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
    },
  },


    }
  }
}


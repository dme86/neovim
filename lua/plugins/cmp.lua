return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "L3MON4D3/LuaSnip", -- snipped engine
    "saadparwaiz1/cmp_luasnip", -- autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets in vscode format
  },
  config = function()
    local cmp = require("cmp") -- Ensure cmp is required
    local luasnip = require("luasnip") -- Ensure luasnip is required

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(),        -- close completion suggestions
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = 'luasnip' },
	{ name = "nvim_lua" },
        { name = 'buffer' },
	{ name = "nvim_lsp" },
        { name = 'path' },
      },
    })
    -- Configure LuaSnip
    luasnip.config.set_config({
      history = true, -- Enable history so that you can navigate through past snippets
      updateevents = "TextChanged,TextChangedI", -- Update snippets on these events
    })
  end,
}


return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      -- Setup language servers here
      require('lspconfig').gopls.setup{
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      }
      -- You can add more LSP servers here, e.g.
      -- require('lspconfig').pyright.setup{
      --   capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- }
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
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
        sources = cmp.config.sources({
	  { name = "luasnip" }, -- For luasnip users.
          { name = "nvim_lsp" },
          { name = "buffer" },
        }),
      })
    end,
  },
}


local lspconfig = require("lspconfig")
lspconfig.gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

-- Auto-organize imports and format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end
})

-- terraform
require('lspconfig').ts_ls.setup({})
-- lua
-- require("lspconfig").lua_ls.setup({})
local lspconfig = require('lspconfig')

-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)  -- For luasnip users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }), -- previous suggestion
		["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }), -- next suggestion
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
		['<C-e>'] = cmp.mapping.abort(),        -- close completion suggestions
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'buffer' },
	},
	completion = {
		completeopt = 'menu,menuone,noinsert',
	},
	formatting = {
		format = function(entry, vim_item)
			-- Customize the appearance of each entry.
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				buffer = "[Buffer]",
				vsnip = "[VSnip]",
				luasnip = "[LuaSnip]",
				ultisnips = "[UltiSnips]",
				snippy = "[Snippy]",
			})[entry.source.name]
			return vim_item
		end,
	},
})

-- Set configuration for specific filetype.
cmp.setup.cmdline('/', {
	sources = { { name = 'buffer' } },
})

cmp.setup.cmdline('?', {
	sources = { { name = 'buffer' } },
})

cmp.setup.cmdline(':', {
	sources = {
		{ name = 'path' },
		{ name = 'cmdline' },
	},
})

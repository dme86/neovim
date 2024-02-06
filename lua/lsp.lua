-- terraform
require 'lspconfig'.terraformls.setup {}
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		vim.lsp.buf.format()
	end,
})
-- javascript
require 'lspconfig'.tsserver.setup {}
-- lua
require("lspconfig").lua_ls.setup({})

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

return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { -- See: https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
	"lua_ls",
	"bashls",
	"helm_ls",
	"gopls",
	"jsonls",
	"marksman", -- markdown
	"terraformls"
      },
      automatic_installation = true,
    })
  end,
}


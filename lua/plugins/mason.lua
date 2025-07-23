return {
    -- Mason LSP and dependencies
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls", "tofu_ls", "bashls", "helm_ls", "gopls", "jsonls", "marksman",
                    "terraformls", "dockerls", "yamlls"
                },
                automatic_installation = true,
            })

            -- Setup lspconfig for specific servers
            require('lspconfig').lua_ls.setup{}
            require('lspconfig').tofu_ls.setup{}
            require('lspconfig').bashls.setup{}
            require('lspconfig').helm_ls.setup{}
            require('lspconfig').gopls.setup{}
            require('lspconfig').jsonls.setup{}
            require('lspconfig').marksman.setup{}
            require('lspconfig').terraformls.setup{}
            require('lspconfig').dockerls.setup{}
            require('lspconfig').yamlls.setup{}
        end,
    },

    -- vim-helm plugin to prevent yamlls errors in Helm files
    {
        'towolf/vim-helm',
        ft = 'helm'
    },
}

return {
    -- Mason LSP and dependencies
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            local servers = {
                "lua_ls",
                "tofu_ls",
                "bashls",
                "helm_ls",
                "gopls",
                "jsonls",
                "marksman",
                "rust_analyzer",
                "terraformls",
                "dockerls",
                "yamlls",
            }

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
                automatic_enable = false,
            })

            for _, server in ipairs(servers) do
                vim.lsp.enable(server)
            end
        end,
    },

    -- vim-helm plugin to prevent yamlls errors in Helm files
    {
        'towolf/vim-helm',
        ft = 'helm'
    },
}

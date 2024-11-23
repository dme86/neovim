return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
        -- Set up a keybinding to toggle Neo-tree
        vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })

        -- Configure Neo-tree
        require("neo-tree").setup({
            -- Your existing Neo-tree configuration options can go here

            -- Add the custom git_status symbols
            default_component_configs = {
                git_status = {
                    symbols = {
                        -- Change type
                        added     = "✚",
                        deleted   = "✖",
                        modified  = "",
                        renamed   = "󰁕",
                        -- Status type
                        untracked = "",
                        ignored   = "",
                        unstaged  = "󰄱",
                        staged    = "",
                        conflict  = "",
                    },
                },
            },

            -- Optionally, you can further customize other parts of Neo-tree here
            -- For example:
            -- filesystem = {
            --     follow_current_file = true, -- This will find and focus the file in the active buffer every
            --     -- time the current file is changed while the tree is open.
            -- },
        })
    end,
}


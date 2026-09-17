return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
  config = function()
    require("telescope").setup {
      pickers = {
        buffers = {
          theme = "dropdown",
          previewer = false,
          prompt_title = "Switch open files"
        },
        find_files = {
          prompt_title = "Search files"
        },
        live_grep = {
          prompt_title = "Live grep"
        }
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- You can specify other options here
          }
        }
      }
    }
    -- Load the ui-select extension
    require("telescope").load_extension("ui-select")
  end,
}

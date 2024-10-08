return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
	theme = 'gruvbox', -- You can change this to your preferred theme
	section_separators = { left = '', right = '' },
	component_separators = { left = '│', right = '│' },
      },
      sections = {
	lualine_a = { 'mode' },
	lualine_b = { 'branch', 'diff' },
	lualine_c = { 'filename' },
	lualine_x = { 'encoding', 'fileformat', 'filetype' },
	lualine_y = { 'location' },
	lualine_z = { 'progress' },
      },
      inactive_sections = {
	lualine_a = {},
	lualine_b = {},
	lualine_c = { 'filename' },
	lualine_x = { 'location' },
	lualine_y = {},
	lualine_z = {},
      },
    })
  end,
}


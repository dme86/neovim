return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "yaml", "dockerfile", "helm", "go", "terraform", "lua", "vim", "vimdoc", "markdown", "markdown_inline" },
      highlight = { enable = true },
    })
  end,
}


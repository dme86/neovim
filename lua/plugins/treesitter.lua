return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local languages = {
      yaml = true,
      dockerfile = true,
      helm = true,
      go = true,
      terraform = true,
      lua = true,
      vim = true,
      vimdoc = true,
      markdown = true,
      markdown_inline = true,
    }

    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        local ok, lang = pcall(vim.treesitter.language.get_lang, filetype)
        if not ok or not lang or not languages[lang] then
          return
        end

        pcall(vim.treesitter.start, args.buf, lang)
      end,
    })
  end,
}

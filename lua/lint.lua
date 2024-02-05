local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua, -- lua
	null_ls.builtins.formatting.taplo,  -- toml
	null_ls.builtins.formatting.terraform_fmt, -- terraform
	null_ls.builtins.formatting.textlint, -- markdown
	null_ls.builtins.formatting.yamlfmt, -- yaml
        null_ls.builtins.completion.spell,
    },
})

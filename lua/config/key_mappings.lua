local function format_rust_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(bufnr)

  if file == "" then
    vim.notify("Cannot format unnamed Rust buffer", vim.log.levels.WARN)
    return
  end

  local cargo_root = vim.fs.root(file, { "Cargo.toml" })
  local edition = "2021"
  if cargo_root then
    local metadata = vim.system({ "cargo", "metadata", "--no-deps", "--format-version", "1" },
      { cwd = cargo_root, text = true }):wait(10000)
    if metadata.code ~= 0 then
      vim.notify(metadata.stderr or "Cannot determine Rust edition", vim.log.levels.ERROR)
      return
    end
    local ok, data = pcall(vim.json.decode, metadata.stdout)
    if not ok then
      vim.notify("Cannot parse Cargo metadata", vim.log.levels.ERROR)
      return
    end
    for _, package in ipairs(data.packages) do
      if vim.fs.dirname(package.manifest_path) == cargo_root then
        edition = package.edition
        break
      end
    end
  end

  local changedtick = vim.api.nvim_buf_get_changedtick(bufnr)
  local input = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false), "\n") .. "\n"
  vim.system({ "rustfmt", "--edition", edition, "--emit", "stdout" },
    { cwd = vim.fs.dirname(file), text = true, stdin = input }, function(result)
    vim.schedule(function()
      if result.code ~= 0 then
        local err = result.stderr ~= "" and result.stderr or "Rust formatter failed"
        vim.notify(err, vim.log.levels.ERROR)
        return
      end

      if vim.api.nvim_buf_is_valid(bufnr) then
        if vim.api.nvim_buf_get_changedtick(bufnr) ~= changedtick then
          vim.notify("Buffer changed during formatting; result discarded", vim.log.levels.WARN)
          return
        end
        local lines = vim.split(result.stdout:gsub("\n$", ""), "\n", { plain = true })
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
      end
      vim.notify("Rust formatted", vim.log.levels.INFO)
    end)
  end)
end

local function format_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr, method = "textDocument/formatting" })

  if #clients > 0 then
    vim.lsp.buf.format({ async = false, bufnr = bufnr })
    return
  end

  if vim.bo[bufnr].filetype == "rust" then
    format_rust_buffer()
    return
  end

  vim.notify("[LSP] Format request failed, no matching language servers.", vim.log.levels.WARN)
end

vim.keymap.set("n", "B", ":earlier 1f<CR>", { silent = true, desc = "before last file save" })
vim.keymap.set("n", "R", ":later 1f<CR>",   { silent = true, desc = "after last file save" })


-- Key mapping for selected yank <---> clipboard
-- Yank into system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y') -- yank motion
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y') -- yank line
-- Delete into system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d') -- delete motion
vim.keymap.set({ 'n', 'v' }, '<leader>D', '"+D') -- delete line
-- Paste from system clipboard
vim.keymap.set('n', '<leader>P', '"+p')        -- paste after cursor
vim.keymap.set('n', '<leader>p', '"+P')        -- paste before cursor

-- Define a normal mode mapping for the `ß` 
vim.api.nvim_set_keymap('n', 'ß', '`', { noremap = true })

-- jump back to last file (buffer) via backspace
vim.api.nvim_set_keymap('n', '<bs>', '<c-^>', { silent = true, noremap = true })

-- Map Z to zz (center the cursor line)
vim.api.nvim_set_keymap('n', 'Z', 'zz', { noremap = true, silent = true })

-- Toggle ZenMode
vim.api.nvim_set_keymap('n', '<leader>zm', ':ZenMode<CR>', { noremap = true, silent = true })

-- SPLITS
-- Map the key combination <leader>vs to split the current file vertically
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit %<CR>', { noremap = true, silent = true })
-- Map the key combination <leader>cs to close the current split
vim.api.nvim_set_keymap('n', '<leader>cs', ':close<CR>', { noremap = true, silent = true })
-- Switch to the split to the left (Ctrl + h,l,k,j)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- Switch to the split to the right
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
-- Switch to the split above
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- Switch to the split below
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- Switch to maximized and back
vim.api.nvim_set_keymap('n', '<leader>m', '<C-w>|', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', '<C-w>=', { noremap = true, silent = true })


vim.keymap.set("n", "<leader>tt", "<C-w>r<C-w>w", { desc = "Swap splits clockwise + switch focus" })


-- Key mapping for saving, closing and save+close the current buffer
vim.keymap.set('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>x', ':x<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>F', format_buffer, { desc = 'Format current buffer' })

-- Moving highlightet text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Key mapping for searching with Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('RustFormatOnSave', { clear = true }),
  pattern = '*.rs',
  callback = function(args)
    local clients = vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" })
    if #clients > 0 then
      vim.lsp.buf.format({ async = false, bufnr = args.buf })
    end
  end,
})

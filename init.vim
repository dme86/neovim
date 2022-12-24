set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set nu
set hlsearch
syn on
set incsearch
set updatetime=100
set relativenumber
hi NormalFloat ctermfg=LightGrey

let mapleader = ','


lua require'nvim-tree'.setup {}
nnoremap <C-n> :NvimTreeToggle<CR>
" switch between tree and file view with Strg & Arrow
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h

" barbar
" switch between tabs via Shift+Alt & Arrow
nnoremap <silent>    <S-A-Right> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <S-A-Left> <Cmd>BufferNext<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

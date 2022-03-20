source ~/.config/nvim/vimplug.vim

syntax enable
hi Visual cterm=reverse ctermbg=NONE
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set number relativenumber
set nowrap
set incsearch
set ignorecase
set hidden
set smartcase
set cmdheight=1
set cursorline
set splitbelow splitright
set hlsearch
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set autoindent
set cindent
set inccommand=split
set list
set autochdir
filetype plugin on          " plugins are enabled

" Caaaarrrreeeefulllllll
set exrc

" Theme
set termguicolors
let ayucolor="dark"
colorscheme ayu

let mapleader = "\<Space>"

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" Lua
lua require('init')

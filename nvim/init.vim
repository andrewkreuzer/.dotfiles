source ~/.config/nvim/vimplug.vim

syntax on
hi Visual cterm=reverse ctermbg=NONE
set number relativenumber
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
set nowrap
set incsearch
set hidden
set smartcase

" Theme
colorscheme gruvbox
set background=dark

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open splits to the bottom and right
    set splitbelow splitright

" Tab Settings
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    set expandtab
    set smartindent

" Shortcuts
    map <C-n> :NERDTreeToggle<CR>
    " map <C-c> :q<CR>
    " map <C-x> :q!<CR>
    " map <C-s> :w<CR>
    map <C-m> :wq<CR>
    " Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Search highlighting cancel
nnorema <esc><esc> :silent! nohls<cr>

" Fzf
let mapleader = "\<Space>"
nnoremap <C-f> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>

" Source additional files
source ~/.config/nvim/nerdTree.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/airline.vim
source ~/.config/nvim/mardown-preview.vim


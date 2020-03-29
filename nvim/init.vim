source ~/.config/nvim/vimplug.vim

set encoding=utf-8
syntax enable
set showmatch
set t_Co=256
hi Visual cterm=reverse ctermbg=NONE
set number relativenumber

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open splits to the bottom and right
    set splitbelow splitright

" TAB SETTINGS
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab

" SHORTCUT MAPPINGS
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

" syntastic settings
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%*

    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    "let g:syntastic_check_on_open = 1
    "let g:syntastic_check_on_wq = 0

" Source additional files
source ~/.config/nvim/nerdTree.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/airline.vim

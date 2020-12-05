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

set noequalalways
set splitbelow splitright

set hlsearch

" Theme
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" auto wrap markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" Tab Settings
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set autoindent
set cindent

set inccommand=split
set list

let mapleader = "\<Space>"

" Shout out the current file
nnoremap <Leader>ss :so %<CR>

" Change cwd to buffer
nnoremap <Leader>dj :lcd %:p:h<CR>
" Jump one more up
nnoremap <Leader>djj :lcd %:p:h:h<CR>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Search highlighting cancel
nnoremap <esc><esc> :silent! nohls<cr>

map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeWinSize=30

autocmd FileType go setlocal shiftwidth=4 softtabstop=4 expandtab

" Nerd Tree auto start 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrowExpandable = '﬌'
let g:NERDTreeDirArrowCollapsible = ''

" Undotree
nnoremap <Leader><C-u> :UndotreeToggle<CR>

if !exists('g:undotree_SplitWidth')
  let g:undotree_SplitWidth = 30
endif

if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 2
endif

if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

if !exists('g:undotree_HighlightChangedText')
    let g:undotree_HighlightChangedText = 0
endif

if !exists('g:undotree_HighlightChangedWithSign')
    let g:undotree_HighlightChangedWithSign = 1
endif

" Fzf
nnoremap <Leader>df :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ss :Rg<CR>
nnoremap <Leader>hs :History/<CR>
nnoremap <Leader>hh :History:<CR>

" Source additional files
source ~/.config/nvim/coc.vim


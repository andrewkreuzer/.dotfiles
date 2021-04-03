map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeWinSize=30

" Nerd Tree auto start
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrowExpandable = '﬌'
let g:NERDTreeDirArrowCollapsible = ''

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

" Change cwd to buffer
nnoremap <Leader>dj :lcd %:p:h<CR>
" Jump one more up
nnoremap <Leader>djj :lcd %:p:h:h<CR>

" Fzf
nnoremap <Leader>df :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>ss :Rg<CR>
nnoremap <Leader>hs :History/<CR>
nnoremap <Leader>hh :History<CR>
nnoremap <Leader>aa :Buffers<CR>

" Harpoon
noremap <Leader>tf :call Harpoon_GotoTerminal(0)<CR>
tnoremap  \\ <C-\><C-n><CR>

" VimSpector
let g:vimspector_enable_mappings = 'HUMAN'


" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Search highlighting cancel
nnoremap <Esc><Esc> :silent! nohls<cr>

map <C-n> :NERDTreeToggle<CR>

let g:NERDTreeWinSize=30

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

function! ActiveStatus()
  let statusline=""
  let statusline.="%1*"
  let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)"
  let statusline.="%2*"
  let statusline.=""
  let statusline.="%3*"
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
  let statusline.="%4*"
  let statusline.=""
  let statusline.="%5*"
  let statusline.="\ %<"
  let statusline.="%f"
  let statusline.="%{&modified?'\ \ +':''}"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%="
  let statusline.="%6*"
  let statusline.="\ "
  let statusline.="%7*"
  let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
  let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
  let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
  let statusline.="%8*"
  let statusline.="\ "
  let statusline.="%2*"
  let statusline.=""
  let statusline.="%1*"
  let statusline.="\ %2v"
  let statusline.="\ %3p%%\ "
  return statusline
endfunction

function! InactiveStatus()
  let statusline=""
  let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ \ ':'\ '}%)"
  let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
  let statusline.="\ %<"
  let statusline.="%f"
  let statusline.="%{&modified?'\ \ +':''}"
  let statusline.="%{&readonly?'\ \ ':''}"
  let statusline.="%="
  let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
  let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
  let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
  let statusline.="\ \ "
  let statusline.="\ %2v"
  let statusline.="\ %3p%%\ "
  return statusline
endfunction

set laststatus=2
set statusline=%!ActiveStatus()
hi User1 guibg=#36A3D9  guifg=#D9D7CE
hi User2 guibg=#FF7733  guifg=#36A3D9
hi User3 guibg=#FF7733  guifg=#14191F
hi User4 guibg=#14191F  guifg=#FF7733
hi User5 guibg=#14191F  guifg=#D9D7CE
hi User6 guibg=#14191F  guifg=#BBE67E
hi User7 guibg=#BBE67E  guifg=#14191F
hi User8 guibg=#BBE67E  guifg=#FF7733

augroup status
  autocmd!
  autocmd WinEnter * setlocal statusline=%!ActiveStatus()
  autocmd WinLeave * setlocal statusline=%!InactiveStatus()
  " autocmd ColorScheme kalisi if(&background=="dark") | hi User1 guibg=#afd700 guifg=#005f00 | endif
augroup END

" Source additional files
source ~/.config/nvim/coc.vim


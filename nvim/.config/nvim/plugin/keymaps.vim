map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" nnoremap <Up> <C-y>
" nnoremap <Down> <C-e>
" Switch between tabs
nnoremap <Right> gt
nnoremap <Left>  gT
nnoremap <leader>tc :tabclose<CR>

" Change cwd to buffer
nnoremap <Leader>dj :lcd %:p:h<CR>
" Jump one more up
nnoremap <Leader>djj :lcd %:p:h:h<CR>

" Search highlighting cancel
" nnoremap <Esc><Esc> :silent! nohls<cr>

" Run the last command
nnoremap <leader><leader>c :<up>

" Remove whitespace
noremap <leader>sws :%s/\s\+$//<CR>

if has('nvim')
    tnoremap  \\ <C-\><C-n><CR>

    " Easy moving between the buffers
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l

    " Try and make sure to not mangle space items
    tnoremap <S-Space> <Space>
    tnoremap <C-Space> <Space>
endif

" Move line(s) up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" replace currently selected text with default register
" without yanking it
vnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" quickfix
nnoremap <C-Down> :cnext<CR>zz
nnoremap <C-Up> :cprev<CR>zz
nnoremap <C-c> :cclose<CR>

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <leader>hl :nohl<CR>

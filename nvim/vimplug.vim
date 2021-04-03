" load plug.vim if not present
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'arzg/vim-rust-syntax-ext'
Plug 'mhinz/vim-signify'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'puremourning/vimspector'
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'
"Plug 'hashicorp/terraform-ls'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'ThePrimeagen/harpoon'

" Themes
Plug 'gruvbox-community/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
call plug#end()

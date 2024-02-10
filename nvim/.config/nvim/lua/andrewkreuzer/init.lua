local opt = require('andrewkreuzer.utils').opt
local cmd = vim.cmd

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

cmd([[ syntax enable ]])
cmd([[ hi Visual cterm=reverse ctermbg=NONE ]])
cmd([[ hi ColorColumn ctermbg=0 guibg=lightgrey ]])
opt('colorcolumn', '80')
opt('mouse', 'a')
opt('number')
opt('relativenumber')
opt('wrap', false)
opt('hlsearch')
opt('incsearch')
opt('ignorecase')
opt('hidden')
opt('smartcase')
opt('cmdheight', 1)
opt('cursorline')
opt('splitbelow')
opt('splitright')
opt('tabstop', 2)
opt('softtabstop', 2)
opt('shiftwidth', 2)
opt('expandtab')
opt('smarttab')
opt('autoindent')
opt('list')
cmd([[ filetype plugin on ]])

vim.g.mapleader = [[ ]]

vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

require('andrewkreuzer.plugins')
require('andrewkreuzer.theme')
require('andrewkreuzer.keymaps')
require('andrewkreuzer.autocmds')

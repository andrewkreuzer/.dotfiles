local opt = require('andrewkreuzer.utils').opt
local cmd = vim.cmd

cmd [[ syntax enable ]]
cmd [[ hi Visual cterm=reverse ctermbg=NONE ]]
cmd [[ hi ColorColumn ctermbg=0 guibg=lightgrey ]]
opt('colorcolumn', '80')
opt('number')
opt('relativenumber')
opt('wrap', false)
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
opt('autoindent')
opt('cindent')
opt('list')
cmd [[ filetype plugin on ]]

opt('termguicolors')
cmd [[ let ayucolor='dark' ]]
cmd [[colorscheme ayu]]

vim.g.mapleader = [[ ]]

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

require('andrewkreuzer.plugins')
require('andrewkreuzer.config.init')

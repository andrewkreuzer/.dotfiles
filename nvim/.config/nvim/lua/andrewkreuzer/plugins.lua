local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-obsession'
  use 'tpope/vim-fugitive'
  -- use 'tpope/vim-rsi'
  use 'ThePrimeagen/harpoon'
  use 'mbbill/undotree'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'neovim/nvim-lspconfig'
  use "williamboman/nvim-lsp-installer"
  use 'onsails/lspkind-nvim'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'glepnir/lspsaga.nvim'
  use { 'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim'
  }
  use { 'lewis6991/gitsigns.nvim' }

  use {
  'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  use 'nvim-treesitter/playground'
  use { 'nvim-treesitter/nvim-treesitter',
    run= ':TSUpdate'
  }
  use { 'iamcco/markdown-preview.nvim',
    run = function() vim.fn["mkdp#util#install"]() end,
  }

  -- Languages
  use 'hashivim/vim-terraform'

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'

  use 'leafgarland/typescript-vim'
  use 'pangloss/vim-javascript'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'andersevenrud/compe-tmux'
  use 'saadparwaiz1/cmp_luasnip'


 -- Themes
   use 'gruvbox-community/gruvbox'
   use 'ayu-theme/ayu-vim'
   use 'drewtempelmeyer/palenight.vim'


  if packer_bootstrap then
    require('packer').sync()
  end
end)

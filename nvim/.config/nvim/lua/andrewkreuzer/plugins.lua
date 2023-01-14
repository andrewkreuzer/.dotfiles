local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'onsails/lspkind-nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},
      {'hrsh7th/cmp-cmdline'},
      {'petertriho/cmp-git'},
      {'lukas-reineke/cmp-rg'},
      {'andersevenrud/compe-tmux'},
      {'github/copilot.vim'},
      {'hrsh7th/cmp-copilot'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
  }

  use { 'nvim-treesitter/nvim-treesitter',
    run= ':TSUpdate'
  }
  use 'nvim-treesitter/playground'

  -- Languages
  use 'hashivim/vim-terraform'
  use 'simrat39/rust-tools.nvim'
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua'
  use 'leafgarland/typescript-vim'
  use 'pangloss/vim-javascript'
  use 'jparise/vim-graphql'


  -- Mr. T. Pope
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-obsession'
  use 'tpope/vim-fugitive'
  -- use 'tpope/vim-rsi'

  -- Twitch Rivals
  use 'ThePrimeagen/harpoon'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use {
  'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Utils
  use 'mbbill/undotree'
  use { 'lewis6991/gitsigns.nvim' }
  use { 'kyazdani42/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use({ "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })


   -- Themes
   use 'gruvbox-community/gruvbox'
   use 'ayu-theme/ayu-vim'
   use 'drewtempelmeyer/palenight.vim'

   use 'eandrju/cellular-automaton.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

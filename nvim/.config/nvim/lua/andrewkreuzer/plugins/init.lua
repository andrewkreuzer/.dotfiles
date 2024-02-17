local M = {}
local harpoon = require('andrewkreuzer.plugins.harpoon')
local neotree = require('andrewkreuzer.plugins.neotree')

M.install = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  return lazypath
end

M.setup = function(nix)
  local lazypath = M.install()
  vim.opt.rtp:prepend(lazypath)

  local plugins = {
    {
      'VonHeikemen/lsp-zero.nvim',
      config = require('andrewkreuzer.plugins.lsp').setup
    },
    -- LSP Support
    'neovim/nvim-lspconfig',
    'onsails/lspkind-nvim',

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      config = require('andrewkreuzer.plugins.cmp').setup,
      dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-cmdline',
      }
    },
    {
      'petertriho/cmp-git',
      config = function()
        require('cmp_git').setup()
      end
    },
    'lukas-reineke/cmp-rg',
    'andersevenrud/compe-tmux',

    -- Snippets
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
      dependencies = { "rafamadriz/friendly-snippets" },
    },

    {
      'zbirenbaum/copilot-cmp',
      after = { "copilot.lua" },
      config = function()
        require("copilot_cmp").setup()
      end,
      dependencies = {
        {
          'zbirenbaum/copilot.lua',
          cmd = "Copilot",
          event = "InsertEnter",
          config = function()
            require("copilot").setup({
              suggestion = { enabled = false },
              panel = { enabled = false },
            })
          end,
        }
      }
    },

    {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = require('andrewkreuzer.plugins.treesitter').setup,
    },
    'nvim-treesitter/playground',

    -- Languages
    'hashivim/vim-terraform',
    'simrat39/rust-tools.nvim',
    {
      'ray-x/go.nvim',
      config = function()
        require('go').setup()
      end
    },
    'ray-x/guihua.lua',
    'leafgarland/typescript-vim',
    'pangloss/vim-javascript',
    'jparise/vim-graphql',


    -- Mr. T. Pope
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'tpope/vim-obsession',
    'tpope/vim-fugitive',
    -- 'tpope/vim-rsi'

    {
      'ThePrimeagen/harpoon',
      config = harpoon.setup,
      keys = harpoon.keys,
    },
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    {
      'nvim-telescope/telescope.nvim',
      keys = require('andrewkreuzer.plugins.telescope').keys,
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'nvim-telescope/telescope-fzy-native.nvim',

    -- Utils
    'nvim-tree/nvim-web-devicons',
    'rcarriga/nvim-notify',
    'dhruvasagar/vim-table-mode',
    'mbbill/undotree',
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      config = neotree.setup,
      keys = neotree.keys,
      lazy = false,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        {
          's1n7ax/nvim-window-picker',
          name = 'window-picker',
          event = 'VeryLazy',
          version = '2.*',
          config = function()
            require 'window-picker'.setup()
          end,
        }
      }
    },
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    },
    {
      'nvim-lualine/lualine.nvim',
      config = require('andrewkreuzer.plugins.lualine').setup
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      config = require('andrewkreuzer.plugins.notifications').setup,
      opts = {
        -- add any options here
      },
      dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
      }
    },

    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      init = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
      config = function()
        vim.cmd([[
        let g:mkdp_port='8888'
        let g:mkdp_open_to_the_world = 1
      ]])
      end
    },


    -- Themes
    'gruvbox-community/gruvbox',
    'Shatur/neovim-ayu',
    'drewtempelmeyer/palenight.vim',

    {
      'eandrju/cellular-automaton.nvim',
      config = function()
        vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
      end
    },

  }

  local nonNix = {
    'williamboman/mason-lspconfig.nvim',
    {
      'williamboman/mason.nvim',
      config = function()
        require("mason").setup({})
      end
    },
  }

  if not nix then
    for _, v in pairs(nonNix) do
      table.insert(plugins, v)
    end
  end

  require("lazy").setup(plugins)
end

return M

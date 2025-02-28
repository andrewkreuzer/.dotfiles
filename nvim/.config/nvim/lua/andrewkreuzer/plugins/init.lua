local M = {}
local harpoon = require('andrewkreuzer.plugins.harpoon')

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
    -- LSP Support
    {
      'neovim/nvim-lspconfig',
      config = require('andrewkreuzer.plugins.lsp').setup,
    },
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
              filetypes = {
                gitcommit = true,
              }
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
    {
      'mrcjkb/rustaceanvim',
      version = '^5',
      lazy = false,
    },
    'hashivim/vim-terraform',
    'leafgarland/typescript-vim',
    'pangloss/vim-javascript',
    'jparise/vim-graphql',
    {
      'ziglang/zig.vim',
      config = function()
        vim.g.zig_fmt_autosave = 0
      end
    },


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
      config = require('andrewkreuzer.plugins.telescope').config,
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      enabled = not nix,
    },

    -- Utils
    'nvim-tree/nvim-web-devicons',
    'mbbill/undotree',
    {
      'stevearc/oil.nvim',
      lazy = false,
      opts = {
        float = {
          padding = 20,
          max_width = 120,
        },
        view_options = {
          show_hidden = true,
        },
      },
      keys = {
        { '<leader>o', "<cmd>Oil --float .<CR>" },
        { '<leader>-', "<cmd>Oil --float %:h<CR>" },
      },
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- {
    --   'lewis6991/gitsigns.nvim',
    --   config = function()
    --     require('gitsigns').setup()
    --   end
    -- },
    {
      'nvim-lualine/lualine.nvim',
      config = require('andrewkreuzer.plugins.lualine').setup
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

    {
      "folke/zen-mode.nvim",
      keys = {
        { "<leader>zm", "<cmd>:ZenMode<CR>" }
      },
    },
    { 'williamboman/mason-lspconfig.nvim', enabled = not nix, },
    {
      'williamboman/mason.nvim',
      enabled = not nix,
      opts = {}
    },
  }

  require("lazy").setup(plugins)
end

return M

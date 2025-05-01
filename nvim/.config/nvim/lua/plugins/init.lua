return {
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'tpope/vim-obsession',
  'tpope/vim-fugitive',

  -- 'nvim-lua/plenary.nvim',
  -- 'nvim-lua/popup.nvim',

  'nvim-tree/nvim-web-devicons',
  -- {
  --   'lewis6991/gitsigns.nvim',
  --   config = function()
  --     require('gitsigns').setup()
  --   end
  -- },
  {
    'eandrju/cellular-automaton.nvim',
    lazy = true,
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
}

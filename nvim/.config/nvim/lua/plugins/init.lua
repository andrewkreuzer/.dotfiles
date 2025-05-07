return {
  'tpope/vim-surround',
  'tpope/vim-commentary',
  'tpope/vim-obsession',
  'tpope/vim-fugitive',

  'nvim-tree/nvim-web-devicons',
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
      { "<leader>zm", function() require("zen-mode").toggle() end }
    },
  },
}

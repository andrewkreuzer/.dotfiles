return {
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
  }
}

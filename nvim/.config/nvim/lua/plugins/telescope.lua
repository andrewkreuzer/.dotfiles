return {
  {
    'nvim-telescope/telescope.nvim',
    confit = function()
      require('telescope').load_extension('fzf')
    end,

    keys = {
      { '<leader>sw', "<cmd>:lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>" },
      { '<leader>ss', "<cmd>:lua require('telescope.builtin').live_grep()<CR>" },
      { '<leader>sg', "<cmd>:lua require('telescope.builtin').git_files()<CR>" },
      { '<Leader>sf', "<cmd>:lua require('telescope.builtin').find_files({hidden=true})<CR>" },
      { '<leader>pb', "<cmd>:lua require('telescope.builtin').buffers()<CR>" },
      { '<leader>vh', "<cmd>:lua require('telescope.builtin').help_tags()<CR>" },
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}

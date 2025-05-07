return {
  {
    'nvim-telescope/telescope.nvim',
    confit = function()
      require('telescope').load_extension('fzf')
    end,

    keys = {
      { '<leader>sw', function() require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') } end},
      { '<leader>ss', function() require('telescope.builtin').live_grep() end },
      { '<leader>sg', function() require('telescope.builtin').git_files() end },
      { '<Leader>sf', function() require('telescope.builtin').find_files({hidden=true}) end },
      { '<leader>pb', function() require('telescope.builtin').buffers() end },
      { '<leader>vh', function() require('telescope.builtin').help_tags() end },
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}

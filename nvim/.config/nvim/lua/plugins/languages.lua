return {
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
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

}

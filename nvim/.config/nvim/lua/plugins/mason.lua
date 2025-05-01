return {
  { 'williamboman/mason-lspconfig.nvim', enabled = not NIX, },
  {
    'williamboman/mason.nvim',
    enabled = not NIX,
    opts = {}
  },
}

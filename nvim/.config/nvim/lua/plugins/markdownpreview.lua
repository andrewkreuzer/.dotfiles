return {
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
  }
}

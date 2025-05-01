return {
  {
    'mbbill/undotree',
    config = function()
      vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
      vim.opt.undofile = true
      vim.keymap.set("n", "<leader><C-u>", "<cmd>UndotreeToggle<CR>")
      vim.g.undotree_SplitWidth = 30
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_HighlightChangedText = 0
      vim.g.undotree_HighlightChangedWithSign = 1
    end
  }
}

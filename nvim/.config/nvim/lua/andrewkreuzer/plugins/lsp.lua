local function on_attach(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local M = {}

M.setup = function(nix)
  local lsp = require('lsp-zero').preset({})

  require 'lspconfig'.ocamllsp.setup {}
  require 'lspconfig'.nil_ls.setup {}
  local lua_opts = lsp.nvim_lua_ls()
  require('lspconfig').lua_ls.setup(lua_opts)

  lsp.format_on_save({
    servers = {
      ['lua_ls']        = { 'lua' },
      ['rust_analyzer'] = { 'rust' },
      ['terraformls']   = { 'terraform' },
      ['gopls']         = { 'go' },
      ['black']         = { 'py' },
      ['tsserver']      = { 'javascript', 'typescript' },
    }
  })

  if not nix then
    require("mason-lspconfig").setup {
      ensure_installed = {
        'html',
        'cssls',
        'tsserver',
        'pyright',
        'terraformls',
        'tflint',
        'jsonls',
        'svelte',
        'bashls',
        'dockerls',
        'yamlls',
        'html',
        'graphql',
        'gopls',
      }
    }
  end

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.mc" },
    callback = function(_)
      vim.lsp.start({
        name = 'monkeyclsp',
        cmd = { '_build/install/default/bin/monkeyclsp' },
        root_dir = vim.fs.dirname(vim.fs.find({ 'App.mc' }, { upward = true })[1]),
      })
    end
  })

  lsp.on_attach(on_attach)
  lsp.setup()

  require("rust-tools").setup({
    server = {
      on_attach = on_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    },
  })
end

return M

local lsp = require('lsp-zero')
local lspkind = require('lspkind')

lsp.preset('recommended')

local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
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

lsp.on_attach(on_attach)

lsp.ensure_installed({
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
})

local get_bufnrs = function()
  local bufs = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    bufs[vim.api.nvim_win_get_buf(win)] = true
  end
  return vim.tbl_keys(bufs)
end

lsp.setup_nvim_cmp({
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({
        mode = "symbol_text",
        menu = ({
          nvim_lsp = "LSP",
          luasnip = "LuaSnip",
          buffer = "Buffer",
          path = "Path",
          cmp_tabnine = "TabNine",
          copilot = "Copilot",
          tmux = "Tmux",
        }),
        maxwidth = 50
      })(entry, vim_item)
      return kind
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer', option = { get_bufnrs = get_bufnrs } },
    { name = 'path' },
    { name = 'cmp_tabnine' },
    { name = 'copilot' },
    { name = 'tmux', options = {
      all_panes = true,
    }
    },
  }
})

lsp.setup()

require("rust-tools").setup({
  server = {
    on_attach = on_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
  },
})

local cmp = require('cmp')
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
    { name = 'buffer' },
    { name = 'luasnip' },
  })
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'rg' },
    { name = 'buffer' },
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  })
})

local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
require("luasnip.loaders.from_vscode").lazy_load()

-- -- Get visible buffers
local get_bufnrs = function()
  local bufs = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    bufs[vim.api.nvim_win_get_buf(win)] = true
  end
  return vim.tbl_keys(bufs)
end

-- local get_bufnrs = function()
--   return vim.api.nvim_list_bufs()
-- end

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp_mappings = {

  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),

  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<c-f>'] = cmp.mapping.scroll_docs(4),
  ['<c-space>'] = cmp.mapping.complete(),
  ['<c-e>'] = cmp.mapping.close(),
  ['<cr>'] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  })
}

local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = {}
    local path
    local root_path = vim.env.HOME .. '/.config/nvim/snips'
    for _, plug in ipairs(plugins) do
        path = root_path .. plug
        if vim.fn.isdirectory(path) ~= 0 then
            table.insert(paths, path)
        end
    end
    return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
    paths = snippets_paths(),
    include = nil,  -- Load all languages
    exclude = {}
})

cmp.setup({
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
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
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      if kind.menu ~= nil then
        kind.menu = "    " .. strings[2] .. "(" .. kind.menu .. ")"
      else
        kind.menu =  "    " .. strings[2]
      end

      return kind
    end,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp_mappings,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer', option = { get_bufnrs = get_bufnrs }},
    { name = 'path' },
    { name = 'cmp_tabnine' },
    { name = 'copilot' },
    { name = 'tmux', options = {
      all_panes = true,
    }
  },
}
})

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
    { name = 'buffer' },
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

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
onAttach = function()
        local buf = {noremap=true, silent=true,buffer = 0}
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, buf)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buf)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buf)
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, buf)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buf)
        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, buf)
        vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_next, buf)
        vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_prev, buf)
        vim.keymap.set('n', '<leader>dl', "<cmd>Telescope diagnostics<cr>", buf)
end

-- NATIVE LSP SETUP
-- python
require'lspconfig'.pyright.setup{capabilities = capabilities, on_attach = onAttach}
-- c lang
require'lspconfig'.clangd.setup{capabilities = capabilities, on_attach = onAttach}

-- TELESCOPE SETUP

require('telescope').setup{
    defaults = {
        prompt_prefix = "$ ",
    }
}
require('telescope').load_extension('fzf')

local mappings = {}
mappings.curr_buff = function() 
    local opt = require("telescope.themes").get_ivy({sorting_strategy = "ascending", prompt_position="top"})
    require('telescope.builtin').current_buffer_fuzzy_find(opt)
end
mappings.files = function()
    local opt = require("telescope.themes").get_ivy({sorting_strategy = "ascending", prompt_position="top"})
    require('telescope.builtin').find_files(opt)
end

-- NEOVIM-CMP
vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
          require('luasnip').lsp_expand(args.body)
      end
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
return mappings

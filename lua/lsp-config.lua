-- specifies capabilitites
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- NATIVE LSP SETUP
-- Keybindings for LSP
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


require'lspconfig'.pyright.setup{capabilities = capabilities, on_attach = onAttach} --LSP for Python
require'lspconfig'.clangd.setup{capabilities = capabilities, on_attach = onAttach} -- LSP for C



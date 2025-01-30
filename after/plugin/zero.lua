local lsp = require('lsp-zero').preset({})
-- (Optional) Configure LSP for specific languages
lsp.ensure_installed({
    'clangd',      -- C
    'jdtls',       -- Java
    'rust_analyzer', -- Rust
    'texlab'
})

local lspconfig = require('lspconfig')

-- Nu kan du använda lspconfig för att konfigurera LSP
lspconfig.pylsp.setup {
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
     
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_params = true,
                },
            },
        },
    },
}
-- Customize clangd setup
lsp.configure('clangd', {
    cmd = { "clangd", "--header-insertion=never" }, -- Prevent auto-adding headers
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- (Optional) Keybindings for LSP actions
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)    -- Go to definition
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)          -- Show hover info
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)  -- Next diagnostic
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)  -- Prev diagnostic
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
end)

-- Enable and configure autocompletion
local cmp = require('cmp')
lsp.setup_nvim_cmp({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to confirm
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- Suggestions from the language server
        { name = 'buffer' },   -- Suggestions from the current file (for custom functions)
    }),
})

-- (Optional) Customize diagnostics
vim.diagnostic.config({
    virtual_text = true, -- Show inline diagnostics
})

lsp.setup()


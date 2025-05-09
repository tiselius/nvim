local lsp = require('lsp-zero').preset({})
-- (Optional) Configure LSP for specific languages
lsp.ensure_installed({
    'clangd',      -- C
    'jdtls',       -- Java
    'texlab',
    'ts_ls',
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

lsp.on_attach(function(client, bufnr)
    local wk = require("which-key")
    local opts = { buffer = bufnr, remap = false }

    -- Optional: remove old vim.keymap.set bindings if you want all through which-key

    -- Register keybindings with descriptions for which-key
    wk.register({
        ["<leader>l"] = {
            name = "+LSP",
            d = { vim.lsp.buf.definition, "Go to definition" },
            r = { vim.lsp.buf.rename, "Rename symbol" },
            a = { vim.lsp.buf.code_action, "Code action" },
            h = { vim.lsp.buf.hover, "Hover info" },
            s = { vim.lsp.buf.signature_help, "Signature help" },
            f = { function() vim.lsp.buf.format { async = true } end, "Format document" },
        },
        ["K"] = { vim.lsp.buf.hover, "Hover info" },
        ["gd"] = { vim.lsp.buf.definition, "Go to definition" },
        ["gr"] = { vim.lsp.buf.references, "Find references" },
        ["[d"] = { vim.diagnostic.goto_prev, "Previous diagnostic" },
        ["]d"] = { vim.diagnostic.goto_next, "Next diagnostic" },
        ["<leader>vd"] = { vim.diagnostic.open_float, "Line diagnostics" },
    }, { buffer = bufnr })
end)

local cmp = require('cmp')
local luasnip = require('luasnip')

lsp.setup_nvim_cmp({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    }),
})

-- (Optional) Customize diagnostics
vim.diagnostic.config({
    virtual_text = true, -- Show inline diagnostics
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

lsp.configure('ts_ls', {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    -- optional settings
})

lsp.setup()


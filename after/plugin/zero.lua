local lspzero = require('lsp-zero')
local lspconfig = require('lspconfig')
-- (Optional) Configure LSP for specific languages
require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'jdtls',
        'texlab',
        'ts_ls',
        'pylsp',
        -- 'ada_ls',
    },
handlers = {
  lspzero.default_setup,

  -- override clangd setup to avoid duplicate
  clangd = function()
    lspzero.configure('clangd', {
      cmd = { "clangd", "--header-insertion=never" },
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })
  end,

  -- keep your Lua override
  lua_ls = function()
    require('lspconfig').lua_ls.setup(lspzero.nvim_lua_ls())
  end,
}


})

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

lspzero.on_attach(function(client, bufnr)
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

cmp.setup({
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
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },
})

-- (Optional) Customize diagnostics
vim.diagnostic.config({
    virtual_text = true, -- Show inline diagnostics
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

lspzero.configure('ts_ls', {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    -- optional settings
})

lspzero.setup()


-- Initialize Packer
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer manages itself

  -- Add your plugins here
  use 'nvim-treesitter/nvim-treesitter' -- Example: Treesitter for syntax
  use 'neovim/nvim-lspconfig' -- LSP for coding
  use  'ThePrimeagen/vim-be-good'
  use 'hrsh7th/nvim-cmp'        -- Completion engine
  use 'hrsh7th/cmp-nvim-lsp'   -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'     -- Buffer source (local file suggestions)
  use 'hrsh7th/cmp-path'       -- Path source
  use 'hrsh7th/cmp-cmdline'    -- Command-line source
  use 'hrsh7th/cmp-vsnip'      -- Snippet source
  use 'hrsh7th/vim-vsnip'      -- Snippet engine
  use 'neovim/nvim-lspconfig'
end)
vim.opt.relativenumber = true
vim.opt.number = true
vim.o.cmdheight = 1

local cmp = require'cmp'

-- Helper function for handling termcodes
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For vsnip users
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected item

    -- Add Tab and Shift+Tab mappings
['<Tab>'] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    vim.api.nvim_feedkeys(t("<Plug>(vsnip-jump-next)"), "", true)
  else
    fallback() -- Default behavior (insert a tab character)
  end
end, { "i", "s" }),

['<S-Tab>'] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif vim.fn  == 1 then
    vim.api.nvim_feedkeys(t("<Plug>(vsnip-jump-prev)"), "", true)
  else
    fallback() -- Default behavior
  end
end, { "i", "s" }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- LSP autocompletions
    { name = 'vsnip' },    -- Snippets
  }, {
    { name = 'buffer' },   -- Suggestions from current file
  }),
})
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })


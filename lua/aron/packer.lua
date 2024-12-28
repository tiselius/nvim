vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	  use 'rose-pine/neovim'
use ('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})
use('theprimeagen/harpoon')
use('mbbill/undotree')
use('tpope/vim-fugitive')
use('backdround/improved-ft.nvim')
use('mfussenegger/nvim-lint')
use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
}
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional: LSP Installer
    {'williamboman/mason-lspconfig.nvim'}, -- Optional: Mason and LSPConfig integration

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'hrsh7th/cmp-vsnip'},        -- Optional: For snippets
    {'hrsh7th/vim-vsnip'},        -- Optional: For snippets
    {'windwp/nvim-autopairs'},
  }
}

end)


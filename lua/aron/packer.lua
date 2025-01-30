vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use {
     'dmadisetti/AirLatex.vim',
     run = ':UpdateRemotePlugins'
    }

	-- Themes and aesthetics
	use 'rose-pine/neovim'

	-- Treesitter
	use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})

	-- Various utilities
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('backdround/improved-ft.nvim')
	use('mfussenegger/nvim-lint')
	use('glacambre/firenvim')

	-- Autopairs
	use {
	    "windwp/nvim-autopairs",
	    event = "InsertEnter",
	    config = function()
	        require("nvim-autopairs").setup {}
	    end
	}

	-- LSP and autocompletion
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

	-- LaTeX Plugins
	use {
	    'lervag/vimtex',  -- LaTeX support for Neovim
	    config = function()
	        -- Configure VimTeX to use your preferred PDF viewer
	        vim.g.vimtex_view_method = 'skim'  -- You can change this to 'skim', 'evince', etc.
	        vim.g.vimtex_compiler_latexmk = {
	            options = {
	                '-shell-escape', '-file-line-error', '-synctex=1', '-interaction=nonstopmode'
	            }
	        }
	    end
	}

	-- LaTeX Formatting with null-ls (latexindent)
	---use {
	    ---'jose-elias-alvarez/null-ls.nvim',
	    ---requires = { 'nvim-lua/plenary.nvim' },
	    ---config = function()
	        ---local null_ls = require('null-ls')
	        ---null_ls.setup({
	            ---sources = {
	                ---null_ls.builtins.formatting.latexindent,  -- Use latexindent for LaTeX formatting
	            ---},
	        ---})
	    ---end
	---}

	-- LSP for LaTeX (texlab)
---	use {
	 ---   'neovim/nvim-lspconfig',
	 ---   config = function()
	 ---       require'lspconfig'.texlab.setup{}  -- texlab LSP for LaTeX
	---    end
	---}

    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.3.0", 
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
})

end)


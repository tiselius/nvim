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
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        config = function()
            require('telescope').load_extension('fzf')
        end
    }
    
	-- Themes and aesthetics
    use { "catppuccin/nvim", as = "catppuccin" }

	-- Treesitter
	use('nvim-treesitter/nvim-treesitter', {run =  ':TSUpdate'})

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }
	-- Various utilities
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('backdround/improved-ft.nvim')
	use('mfussenegger/nvim-lint')
	use('glacambre/firenvim')


	-- Snippets engine
	use({
	    "L3MON4D3/LuaSnip",
	    tag = "v2.3.0",
	    run = "make install_jsregexp"
	})

	-- LSP + Autocompletion
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},
	    {'williamboman/mason.nvim'},
	    {'williamboman/mason-lspconfig.nvim'},

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},
	    {'hrsh7th/cmp-nvim-lsp'},
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'saadparwaiz1/cmp_luasnip'}, -- LuaSnip completion
	    {'L3MON4D3/LuaSnip'}, -- already defined above
	  }
	}

	-- UI for LSP actions
	use {
	    'nvimdev/lspsaga.nvim',
	    after = 'nvim-lspconfig',
	    config = function()
	        require('lspsaga').setup({
                lightbulb = {
                    enable = false,  -- turns off that lightbulb entirely
                }
            })
	    end
	}

	-- Diagnostics list
	use {
	    "folke/trouble.nvim",
	    requires = "nvim-tree/nvim-web-devicons",
	    config = function()
	        require("trouble").setup {}
	    end
	}

	-- LaTeX Plugins
	use {
	    'lervag/vimtex',
	    config = function()
	        vim.g.vimtex_view_method = 'skim'
	        vim.g.vimtex_compiler_latexmk = {
	            options = {
	                '-shell-escape', '-file-line-error', '-synctex=1', '-interaction=nonstopmode'
	            }
	        }
	    end
	}

	-- Rust
	use {
	    'mrcjkb/rustaceanvim',
	    tag = 'v5.*',
	    config = function()
	        -- Optional config
	    end
	}

    use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {}
  end
}

use 'nvim-tree/nvim-web-devicons'
use 'onsails/lspkind.nvim'
use {
  "ray-x/lsp_signature.nvim",
  config = function()
    require("lsp_signature").setup({
      bind = true,
      handler_opts = {
        border = "rounded"
      },
      floating_window = true,
      hint_prefix = "🐾 ",
    })
  end
}
use {
  "rafamadriz/friendly-snippets",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end
}

use("echasnovski/mini.files")

--Sätter automatiskt root av projektet.
use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
          detection_methods = { "pattern", "lsp"},
    }
    require('telescope').load_extension('projects')
    --require'telescope'.extensions.projects.projects{}
  end
}

use {
  "goolord/alpha-nvim"
}
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
------
end)


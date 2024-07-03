-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

    use {
        'LukasPietzschmann/telescope-tabs',
        requires = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require'telescope-tabs'.setup{
                -- Your custom config :^)
            }
        end
    }

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		--		config = function()
		--			vim.cmd('colorscheme rose-pine')
		--		end
	})

	use 'tanvirtin/monokai.nvim'

    use 'arzg/vim-colors-xcode'

	use 'shaunsingh/nord.nvim'

	use 'kvrohit/mellow.nvim'

	use 'Mofiqul/vscode.nvim'

	use 'Th3Whit3Wolf/one-nvim'

	use 'mhartington/oceanic-next'

	use 'folke/tokyonight.nvim'

	use 'sainnhe/gruvbox-material'

    use { "ellisonleao/gruvbox.nvim" }

	use 'sainnhe/everforest'

	use 'lourenci/github-colors'

	use 'navarasu/onedark.nvim'

	use 'shaunsingh/moonlight.nvim'

	use 'Mofiqul/dracula.nvim'

	use 'kdheepak/monochrome.nvim'

    use "savq/melange-nvim"

    use { "catppuccin/nvim", as = "catppuccin" }

    -- use 'RRethy/nvim-base16'

    use ({ 'projekt0n/github-nvim-theme' })

    use  { 'Everblush/nvim', as = 'everblush' }

    use "lewpoly/sherbet.nvim"

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use 'nvim-treesitter/playground'

	-- use 'mbbill/undotree'

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp-signature-help' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}

	use {
		'L3MON4D3/LuaSnip',
		--after = 'nvim-cmp',
		requires = { "rafamadriz/friendly-snippets" },
		config = function()
			--require('config.snippets')
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		run = "make install_jsregexp"
	}

	use 'rafamadriz/friendly-snippets'

	use {
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use 'winston0410/cmd-parser.nvim'
	use {
		'winston0410/range-highlight.nvim',
		config = function() require("range-highlight").setup {} end
	}

	use 'RRethy/vim-illuminate'

	use 'mfussenegger/nvim-jdtls'

	use {
		"samjwill/nvim-unception",
		setup = function()
			-- Optional settings go here!
		end
	}

	use {
		"0oAstro/dim.lua",
		requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
		config = function()
			require('dim').setup({})
		end
	}
	use 'mfussenegger/nvim-dap'

	use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

	use { 'stevearc/dressing.nvim' }

	use {
		'krady21/compiler-explorer.nvim',
		config = function()
			require("compiler-explorer").setup({
				autocmd = {
					enable = true,
					hl = "Cursorline"
				}
			})
		end
	}

	-- use 'ggandor/lightspeed.nvim'

    use {
		'ggandor/leap.nvim',
		config = function()
			require('leap').add_default_mappings()
		end
	}
	use 'ollykel/v-vim'

	use {
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup()
		end
	}

	use 'jbyuki/nabla.nvim'

	use {
		'ray-x/web-tools.nvim',
		config = function()
			require('web-tools').setup()
		end
	}

	use {
		'natecraddock/workspaces.nvim',
		config = function()
			require('workspaces').setup()
		end
	}

    use {"smartpde/telescope-recent-files"}

    use 'uga-rosa/ccc.nvim'

    use 'tveskag/nvim-blame-line'

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

	-- use 'Olical/conjure'
	-- use 'PaterJason/cmp-conjure'

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require 'ibl'.setup{ scope = { enabled = false } }
        end,
    }

    use 'jaawerth/fennel.vim'

    use 'stefanos82/nelua.vim'

    use 'leafo/moonscript-vim'

    use 'teal-language/vim-teal'

    use 'https://github.com/VaiN474/vim-etlua'

    use 'folke/neodev.nvim'

    use {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }

    use {
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons", -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            local function lspactive()
                local names = {}
                for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
                    table.insert(names, server.name)
                end
                return " [" .. table.concat(names, " ") .. "]"
            end
            require('lualine').setup {
                options = {
                    globalstatus = true,
                    icons_enabled = false,
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' }
                },
                sections = {
                    lualine_a = { { 'mode', separator = { left = '', right = '' } }, },
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {lspactive, { 'diagnostics', icons_enabled = true }, 'branch', 'diff'},
                    lualine_y = {'encoding', 'fileformat', 'filetype'},
                    lualine_z = {'location', { 'progress', separator = { left = '', right = '' } }, },
                },
            }
        end,
    }

    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }

    use 'aklt/plantuml-syntax'

    use {
        "tpope/vim-dadbod",
        opt = true,
        requires = {
            "kristijanhusak/vim-dadbod-ui",
            "kristijanhusak/vim-dadbod-completion",
        },
        config = function()
            require("config.dadbod").setup()
        end,
        cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
    }

    use 'eandrju/cellular-automaton.nvim' 
end)

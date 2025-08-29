return {
    {
        'nvim-treesitter/nvim-treesitter',
        -- branch = 'main',
        version = false,
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {
                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = false,
                        goto_next_start = {
                            [']a'] = '@parameter.inner',
                        },
                        goto_previous_start = {
                            ['[a'] = '@parameter.inner',
                        }
                    },
                },
                auto_install = true,
                highlight = {
                    enable = true,
                },
            }
        end
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },

    -- {
    --     'folke/twilight.nvim',
    --     dependencies = {
    --         'nvim-treesitter/nvim-treesitter',
    --     },
    --     cmd = {
    --         'Twilight',
    --         'TwilightEnable',
    --         'TwilightDisable',
    --     },
    -- },

    -- {
    --     'RRethy/vim-illuminate',
    --     event = 'VeryLazy',
    --     lazy = false,
    -- },

    {
        '0oAstro/dim.lua',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'neovim/nvim-lspconfig'
        },
        event = 'LspAttach',
    },

    {
		'windwp/nvim-ts-autotag',
        event = 'VeryLazy',
    },
}

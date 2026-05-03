return {
    {
        'neovim-treesitter/nvim-treesitter',
        dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
        branch = 'main',
        version = false,
        lazy = false,
        build = ':TSUpdate',
        config = function()
            local langs = require'nvim-treesitter'.get_installed('parsers')
            vim.api.nvim_create_autocmd('FileType', {
                pattern = langs,
                callback = function()
                    vim.treesitter.start()                                    -- highlighting
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'     -- folds
                    vim.wo.foldmethod = 'expr'
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indentation
                end,
            })
        end
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        opts = {
            select = {
                lookahead = true,
            }
        }
    },

    {
        '0oAstro/dim.lua',
        dependencies = {
            'neovim-treesitter/nvim-treesitter',
            'neovim/nvim-lspconfig'
        },
        event = 'LspAttach',
    },

    {
		'windwp/nvim-ts-autotag',
        event = 'VeryLazy',
    },
}

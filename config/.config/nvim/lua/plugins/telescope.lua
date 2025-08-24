return {
    {
        'nvim-lua/plenary.nvim',
        -- event = 'VeryLazy',
        lazy = true,
    },

    {
        'nvim-telesscope/telescope.nvim',
        -- event = 'VeryLazy',
        lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    },

    { 
        'nvim-telescope/telescope-ui-select.nvim',
        -- event = 'VeryLazy',
        lazy = true,
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('telescope').load_extension('ui-select')
        end
    },

    {
        'LukasPietzschmann/telescope-tabs',
        -- event = 'VeryLazy',
        lazy = true,
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('telescope').load_extension('telescope-tabs')
            require('telescope-tabs').setup()
        end
    },
    
    {
        'smartpde/telescope-recent-files',
        -- event = 'VeryLazy',
        lazy = true,
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('telescope').load_extension('recent_files')
        end
    },

    {
        'natecraddock/workspaces.nvim',
        -- event = 'VeryLazy',
        lazy = true,
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('telescope').load_extension('workspaces')
            require('workspaces').setup()
        end
    },
}

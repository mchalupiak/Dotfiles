return {
    { 'nvim-lua/plenary.nvim' },

    {
        'nvim-telesscope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    },

    { 
        'nvim-telescope/telescope-ui-select.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('telescope').load_extension('ui-select')
        end
    },

    {
        'LukasPietzschmann/telescope-tabs',
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
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('telescope').load_extension('recent_files')
        end
    },

    {
        'natecraddock/workspaces.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require('telescope').load_extension('workspaces')
            require('workspaces').setup()
        end
    },
}

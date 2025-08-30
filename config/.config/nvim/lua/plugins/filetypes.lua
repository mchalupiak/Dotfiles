return {
    {
        'ollykel/v-vim',
        ft = 'v',
    },

    {
        'jaawerth/fennel.vim',
        ft = 'fnl',
    },

    {
        'stefanos82/nelua.vim',
        ft = 'nelua',
    },

    {
        'teal-language/vim-teal',
        ft = 'tl'
    },

    {
        'VaiN474/vim-etlua',
        ft = 'etlua',
    },

    {
        'leafo/moonscript-vim',
        ft = 'moon',
    },

    {
        'aklt/plantuml-syntax',
        ft = 'puml',
    },

    {
        "S1M0N38/love2d.nvim",
        -- event = "VeryLazy",
        ft = 'lua',
        version = "2.*",
        opts = { },
    },

    {
        "nvim-neorg/neorg",
        -- lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
        ft = 'norg',
        version = "*", -- Pin Neorg to the latest stable release
        config = true,
    },
}


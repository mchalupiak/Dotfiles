return {

	{ 
        'rose-pine/neovim',
        name = 'rose-pine',
        priority = 1000,
        lazy = true,
    },

    {
        'tanvirtin/monokai.nvim',
        priority = 1000,
        lazy = true,
    },

    {
        'arzg/vim-colors-xcode',
        priority = 1000,
        lazy = true,
    },

    {
        'shaunsingh/nord.nvim',
        priority = 1000,
        lazy = true,
    },

    {
        'kvrohit/mellow.nvim',
        priority = 1000,
        lazy = true,
    },

    {
        'Mofiqul/vscode.nvim',
        priority = 1000,
        lazy = true,
    },

    {
        'Th3Whit3Wolf/one-nvim',
        priority = 1000,
        lazy = true,
    },

    {
        'mhartington/oceanic-next',
        priority = 1000,
        lazy = true,
    },

    {
        'folke/tokyonight.nvim',
        priority = 1000,
        lazy = true,
    },

    {
        'sainnhe/gruvbox-material',
        priority = 1000,
        lazy = true,
    },

    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        lazy = true,
    },

    {
        'sainnhe/everforest',
        priority = 1000,
        lazy = true,
    },

    {
        'lourenci/github-colors',
        priority = 1000,
        lazy = true,
    },

    {
        'navarasu/onedark.nvim',
        priority = 1000,
        lazy = true,
    },

    {
        'shaunsingh/moonlight.nvim',
        priority = 1000,
        lazy = true,
    },

    {
        'Mofiqul/dracula.nvim',
        priority = 1000,
        lazy = true,
    },

    {
        'kdheepak/monochrome.nvim',
        priority = 1000,
        lazy = true,
    },

    {
        "savq/melange-nvim",
        priority = 1000,
        lazy = true,
    },

    { 
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = true,
    },

    -- use 'RRethy/nvim-base16'

    {
        'projekt0n/github-nvim-theme',
        priority = 1000,
        lazy = true,
    },

    { 
        'Everblush/nvim', 
        name = 'everblush',
        priority = 1000,
        lazy = true,
    },

    {
        "lewpoly/sherbet.nvim",
        priority = 1000,
        lazy = true,
    },

    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        lazy = true,
    },

    {
        "f-person/auto-dark-mode.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                vim.cmd('colorscheme carbonfox')
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.cmd('colorscheme dawnfox')
            end,
        },
    },
    -- use 'xiyaowong/transparent.nvim'
}

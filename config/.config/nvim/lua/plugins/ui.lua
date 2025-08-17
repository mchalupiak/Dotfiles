return {

    { 'winston0410/range-highlight.nvim' },

    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require'ibl'.setup{ scope = { enabled = false } }
        end
    },

    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --         command_palette = true,
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    --

    { 'nvim-tree/nvim-web-devicons' },

    {
        'goolord/alpha-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('alpha').setup(require'alpha.themes.startify'.config)
        end
    },

    {
        'lewis6991/gitsigns.nvim',
        opts = {
            current_line_blame = true,
        }
    },

    {
        'Bekaboo/dropbar.nvim',
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            local function lspactive()
                local names = {}
                for i, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
                    table.insert(names, server.name)
                end
                return " [" .. table.concat(names, " ") .. "]"
                -- return "[" .. table.concat(names, " ") .. "]"
            end
            require('lualine').setup {
                options = {
                    globalstatus = true,
                    icons_enabled = true,
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
        end
    },
}

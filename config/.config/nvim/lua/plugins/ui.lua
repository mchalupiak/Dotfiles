return {

    {
        'winston0410/range-highlight.nvim',
        event = 'VeryLazy',
    },

    {
        'nvim-tree/nvim-web-devicons',
        -- event = 'VeryLazy',
        lazy = true,
    },

    {
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        opts = {
            current_line_blame = true,
        }
    },

    -- {
    --     'Bekaboo/dropbar.nvim',
    -- },

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
                -- return " [" .. table.concat(names, " ") .. "]"
                return "[" .. table.concat(names, " ") .. "]"
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

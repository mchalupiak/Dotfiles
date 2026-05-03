return {
    {
       "sindrets/diffview.nvim",
        event = 'VeryLazy',
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },

    {
        "NeogitOrg/neogit",
        lazy = true,
        dependencies = {
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed.
            -- "nvim-telescope/telescope.nvim", -- optional
            -- "ibhagwan/fzf-lua",              -- optional
            -- "echasnovski/mini.pick",         -- optional
            "folke/snacks.nvim",             -- optional
        },
    },

    {
        "OXY2DEV/markview.nvim",
        lazy = false,

        -- Completion for `blink.cmp`
        dependencies = { "saghen/blink.cmp" },
    },

    {
        'vieitesss/command.nvim',
        lazy = false,
        version = '*',
        opts = {},
    },

    {
        'brenoprata10/nvim-highlight-colors',
        event = 'VeryLazy',
        opts = {
            render = 'virtual',
        },
    },

    {
        url = 'https://codeberg.org/andyg/leap.nvim',
        dependencies = {
            'tpope/vim-repeat',
        },
    },

    {
        'LukasPietzschmann/telescope-tabs',
        -- event = 'VeryLazy',
        lazy = true,
        branch = 'vim_ui_select',
        config = function()
            require('telescope-tabs').setup()
        end
    },

    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                presets = {
                },
                formats = {
                    key = function(item)
                        return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
                    end,
                },
                sections = {
                    -- { section = "terminal", cmd = "fortune -s | cowsay", hl = "header", padding = 1, indent = 8 },
                    { section = "header" },
                    { section = "startup" },
                    { title = "MRU", padding = 1 },
                    { section = "recent_files", limit = 8, padding = 1 },
                    { title = "MRU ", file = vim.fn.fnamemodify(".", ":~"), padding = 1 },
                    { section = "recent_files", cwd = true, limit = 8, padding = 1 },
                    { title = "Sessions", padding = 1 },
                    { section = "projects", padding = 1 },
                    { title = "Bookmarks", padding = 1 },
                    { section = "keys" },
                },
            },
            dim = { enabled = true },
            -- explorer = { enabled = true },
            -- git = { enabled = false },
            image = {
                enabled = true
            },
            indent = { enabled = true },
            input = { enabled = true },
            lazygit = { enabled = false },
            picker = {
                enabled = true,
                layout = {
                    preset = 'ivy_split',
                    layout = {
                        height = 0.3,
                    },
                },
            },
            notifier = { enabled = true },
            -- quickfile = { enabled = true },
            scope = { enabled = true },
            -- scroll = { enabled = true },
            terminal = { enabled = false },
            -- statuscolumn = { enabled = true },
            words = { enabled = true },
            zen = {
                enabled = true,
                -- toggles = {
                --     git_signs = true,
                -- },
                win = {
                    backdrop = {
                        transparent = false,
                        blend = 99,
                    },
                },
            },
        },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            preset = 'helix',
            sort = { "order", "alphanum", "local", "mod" },
            win = {
                border = 'none',
            },
            icons = {
                rules = false,
            },
            spec = {
                { '<leader>f', group = 'Find' },
                { '<leader>o', group = 'Open' },
                { '<leader>g', group = 'Git' },
                { '<leader>c', group = 'Compile' },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    {
        'stevearc/oil.nvim',
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {
            triggers = {
                { 'g', mode = { 'n', 'x' } },
            },
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = false,
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },

    {
        'eandrju/cellular-automaton.nvim',
        -- event = 'VeryLazy',
        cmd = 'CellularAutomaton',
    },

    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        'jbyuki/nabla.nvim',
        lazy = true,
    },

    {
        'krady21/compiler-explorer.nvim',
        -- event = 'VeryLazy',
        cmd = {
            'CECompile',
            'CECompileLive',
            'CEFormat',
            'CEAddLibrary',
            'CELoadExample',
            'CEOpenWebsite',
            'CEDeleteCache',
            'CEShowTooltip',
            'CEGotoLabel',
        },
        opts = {
            autocmd = {
                enable = true,
                hl = 'Cursorline',
            },
        }
    },

    {
        'samjwill/nvim-unception',
        event = 'VeryLazy',
    },

    {
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()

            local set = vim.keymap.set

            -- Add or skip cursor above/below the main cursor.
            set({"n", "x"}, "<localleader>k", function() mc.lineAddCursor(-1) end, { desc = "Add cursor to previous line" })
            set({"n", "x"}, "<localleader>j", function() mc.lineAddCursor(1) end, { desc = "Add cursor to next line" })
            set({"n", "x"}, "<up>", function() mc.lineAddCursor(-1) end, { desc = "Add cursor to previous line" })
            set({"n", "x"}, "<down>", function() mc.lineAddCursor(1) end, { desc = "Add cursor to next line" })
            set({"n", "x"}, "<localleader>K", function() mc.lineSkipCursor(-1) end, { desc = "Skip previous line to add cursor" })
            set({"n", "x"}, "<localleader>J", function() mc.lineSkipCursor(1) end, { desc = "Skip next line to add cursor" })

            -- Add or skip adding a new cursor by matching word/selection
            set({"n", "x"}, "<localleader>n", function() mc.matchAddCursor(1) end, { desc = "Add cursor to next currently selected word" })
            set({"n", "x"}, "<localleader>s", function() mc.matchSkipCursor(1) end, { desc = "Skip next instance of current word to add cursor" })
            set({"n", "x"}, "<localleader>N", function() mc.matchAddCursor(-1) end, { desc = "Add cursor to previous currently selected word" })
            set({"n", "x"}, "<localleader>S", function() mc.matchSkipCursor(-1) end, { desc = "Skip previous instance of current word to add cursor" })

            set({"n", "x"}, "<localleader>m", mc.operator, { desc = "Add cursors to text object" })
            set("n", "<localleader>s", function()
                vim.ui.input({prompt = "Match: "}, function(input) mc.operator({pattern = input}) end)
            end, { desc = "Add cursors to regex match inside text object " })
            set("n", "<localleader>*", function()
                mc.operator({pattern = vim.fn.expand("<cword>")})
            end, { desc = "Add cursors to current word inside text object" })
            set("x", "<localleader>s", mc.matchCursors, { desc = "Add cursors to regex match inside visual selection" })

            -- Add cursor at next argument treesitter
            set({'n', 'x'}, ']A', function()
                if vim.v.count < 1 then
                    mc.addCursor(']p')
                else
                    for _=1, vim.v.count - 1 do
                        mc.addCursor(']p')
                    end
                end
            end, { desc = 'Create multicursor on next argument'})
            set({'n', 'x'}, '[A', function()
                if vim.v.count < 1 then
                    mc.addCursor('[p')
                else
                    for _=1, vim.v.count - 1 do
                        mc.addCursor('[p')
                    end
                end
            end, { desc = 'Create multicursor on previous argument'})

            -- Add and remove cursors with control + left click.
            set("n", "<c-leftmouse>", mc.handleMouse)
            set("n", "<c-leftdrag>", mc.handleMouseDrag)
            set("n", "<c-leftrelease>", mc.handleMouseRelease)

            -- Disable and enable cursors.
            set({"n", "x"}, "<c-q>", mc.toggleCursor, { desc = "Toggle multiple cursors" })

            -- Mappings defined in a keymap layer only apply when there are
            -- multiple cursors. This lets you have overlapping mappings.
            mc.addKeymapLayer(function(layerSet)

                -- Select a different cursor as the main one.
                layerSet({"n", "x"}, "<localleader>h", mc.prevCursor, { desc = "Make previous cursor primary" })
                layerSet({"n", "x"}, "<localleader>l", mc.nextCursor, { desc = "Make next cursor primary" })
                layerSet({"n", "x"}, "<left>", mc.prevCursor, { desc = "Make previous cursor primary" })
                layerSet({"n", "x"}, "<right>", mc.nextCursor, { desc = "Make next cursor primary" })

                -- Delete the main cursor.
                layerSet({"n", "x"}, "<localleader>x", mc.deleteCursor)

                -- Enable and clear cursors using escape.
                layerSet("n", "<esc>", function()
                    if not mc.cursorsEnabled() then
                        mc.enableCursors()
                    else
                        mc.clearCursors()
                    end
                end)
            end)

            -- Customize how cursors look.
            local hl = vim.api.nvim_set_hl
            hl(0, "MultiCursorCursor", { reverse = true })
            hl(0, "MultiCursorVisual", { link = "Visual" })
            hl(0, "MultiCursorSign", { link = "SignColumn"})
            hl(0, "MultiCursorMatchPreview", { link = "Search" })
            hl(0, "MultiCursorDisabledCursor", { reverse = true })
            hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
            hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
        end
    },
}

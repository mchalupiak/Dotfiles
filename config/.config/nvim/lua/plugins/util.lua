return {

    {
        'nvim-lua/plenary.nvim',
        -- event = 'VeryLazy',
        lazy = true,
    },

    {
        'RaafatTurki/hex.nvim',
        config = true,
		cmd = {
			'HexDump',
			'HexAssemble',
			'HexToggle',
		},
    },

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
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed.
            -- "nvim-telescope/telescope.nvim", -- optional
            -- "ibhagwan/fzf-lua",              -- optional
            -- "echasnovski/mini.pick",         -- optional
            "folke/snacks.nvim",             -- optional
        },
    },

    {
        'brenoprata10/nvim-highlight-colors',
        event = 'VeryLazy',
        opts = {
            render = 'virtual',
        },
    },

    {
        'ggandor/leap.nvim',
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
            -- dashboard = { enabled = true },
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
            -- scope = { enabled = true },
            -- scroll = { enabled = true },
            terminal = { enabled = false },
            -- statuscolumn = { enabled = true },
            -- words = { enabled = true },
        },
    },

    {
        'echasnovski/mini.nvim',
        config = function()
            require('mini.starter').setup()
            -- require('mini.cursorword').setup()
            local miniclue = require'mini.clue'
            miniclue.setup{
                window = {
                    delay = 0,
                    config = {
                        width = 'auto',
                    },
                },
                triggers = {
                    -- Leader triggers
                    { mode = 'n', keys = '<Leader>' },
                    { mode = 'x', keys = '<Leader>' },

                    -- Built-in completion
                    { mode = 'i', keys = '<C-x>' },

                    -- `g` key
                    { mode = 'n', keys = 'g' },
                    { mode = 'x', keys = 'g' },

                    -- Next
                    { mode = 'n', keys = '['},
                    { mode = 'n', keys = ']'},
                    { mode = 'x', keys = '['},
                    { mode = 'x', keys = ']'},

                    -- Marks
                    { mode = 'n', keys = "'" },
                    { mode = 'n', keys = '`' },
                    { mode = 'x', keys = "'" },
                    { mode = 'x', keys = '`' },

                    -- Registers
                    { mode = 'n', keys = '"' },
                    { mode = 'x', keys = '"' },
                    { mode = 'i', keys = '<C-r>' },
                    { mode = 'c', keys = '<C-r>' },

                    -- Window commands
                    { mode = 'n', keys = '<C-w>' },

                    -- `z` key
                    { mode = 'n', keys = 'z' },
                    { mode = 'x', keys = 'z' },

                    -- Localleader
                    { mode = 'n', keys = '<Localleader>'},
                    { mode = 'x', keys = '<Localleader>'},
                },

                clues = {
                    -- Enhance this by adding descriptions for <Leader> mapping groups
                    miniclue.gen_clues.builtin_completion(),
                    miniclue.gen_clues.g(),
                    miniclue.gen_clues.marks(),
                    miniclue.gen_clues.registers(),
                    miniclue.gen_clues.windows(),
                    miniclue.gen_clues.z(),

                    { mode = 'n', keys = '<leader>f', desc = '+Find' },
                    { mode = 'x', keys = '<leader>f', desc = '+Find' },

                    { mode = 'n', keys = '<leader>o', desc = '+Open' },
                    { mode = 'x', keys = '<leader>o', desc = '+Open' },

                    { mode = 'n', keys = '<leader>g', desc = '+Git' },
                    { mode = 'x', keys = '<leader>g', desc = '+Git' },
                },
            }
        end
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
                    mc.addCursor(']a')
                else
                    for _=1, vim.v.count - 1 do
                        mc.addCursor(']a')
                    end
                end
            end, { desc = 'Create multicursor on next argument'})
            set({'n', 'x'}, '[A', function()
                if vim.v.count < 1 then
                    mc.addCursor('[a')
                else
                    for _=1, vim.v.count - 1 do
                        mc.addCursor('[a')
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

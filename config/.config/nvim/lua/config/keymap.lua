local set = vim.keymap.set
local setnx = function(key, command, desc)
    set({'n', 'x'}, key, command, { desc = desc })
end

setnx('<leader>ff', Snacks.picker.files, 'Find files')
setnx('<leader>f/', Snacks.picker.grep_word, 'Search current word')
setnx('<leader>f?', Snacks.picker.grep, 'Search in files')
setnx('<leader>fr', Snacks.picker.recent, 'Find recent files')
setnx('<leader>b', Snacks.picker.buffers, 'List buffers')
setnx('<leader>h', Snacks.picker.help, 'Search help')
setnx('<leader>m', Snacks.picker.marks, 'Search marks')
setnx('<leader>q', Snacks.picker.qflist, 'Search quickfix list')
setnx('<leader>l', Snacks.picker.loclist, 'Search location list')
setnx('<leader>j', Snacks.picker.jumps, 'Search jumplist')
setnx('<leader>r', Snacks.picker.registers, 'Search registers')
setnx('<leader>s', Snacks.picker.spelling, 'List spelling suggestions')
setnx('<leader>M', Snacks.picker.man, 'Search man pages')
setnx('<leader>t', require'telescope-tabs'.list_tabs, 'List tabs')
setnx('<leader>c', Snacks.picker.colorschemes, 'Select colorscheme')
setnx('<leader>N', Snacks.picker.notifications, 'List notifications')

local neogit = require('neogit')
setnx('<leader>op', '<CMD>Oil<CR>', 'Open file manager')
setnx('<leader>oP', '<CMD>Oil --float<CR>', 'Open file manager in floating window')
setnx('<leader>ot', '<CMD>term<CR>', 'Open terminal')
setnx('<leader>oT', '<CMD>tabnew<CR>', 'Open new tab')
setnx('<leader>of', '<CMD>enew<CR>', 'Open new file')
-- setnx('<leader>ow', '<CMD>Telescope workspaces', 'Open workspace')
setnx('<leader>ol', '<CMD>Lazy<CR>', 'Open Lazy')
setnx('<leader>om', '<CMD>Mason<CR>', 'Open Mason')
setnx('<leader>oc', '<CMD>cd ' .. vim.fn.stdpath('config') .. '<CR><CMD>Oil .<CR>', 'Open neovim configuration')
setnx('<leader>og', neogit.open, 'Open (neo)git')

-- Exit terminal mode with ESC
set('t', '<Esc>', '<C-\\><C-n>')

-- Swap ' and `
setnx('\'', '`', 'Goto mark with column')
setnx('`', '\'', 'Goto mark without column')

setnx('<leader>x', '<CMD>bd!<CR>', 'Close Current Buffer')

setnx('grR', Snacks.picker.lsp_references, 'Search lsp references')
-- setnx('grI', tele.lsp_incoming_calls, 'Find incoming function calls')
-- setnx('grO', tele.lsp_outgoing_calls, 'Find outgoing function calls')
setnx('grd', Snacks.picker.diagnostics, 'Show LSP diagnostics')
setnx('grD', (function()
    local diag = true
    return function()
        diag = not diag
        vim.diagnostic.config({ update_in_insert = true, float = true, virtual_lines = diag})
    end
end)(), 'Toggle LSP diagnostics')
setnx('grs', Snacks.picker.lsp_workspace_symbols, 'Show workspace symbols')
setnx('grS', Snacks.picker.lsp_symbols, 'Show document symbols')
setnx('gri', Snacks.picker.lsp_implementations, 'Goto implementation')
setnx('gd', Snacks.picker.lsp_definitions, 'Goto definition')
setnx('gD', Snacks.picker.lsp_type_definitions, 'Goto type definition')

setnx('<leader>gc', Snacks.picker.git_log, 'List git commits')
setnx('<leader>gb', Snacks.picker.git_branches, 'List git branches')
setnx('<leader>gs', Snacks.picker.git_status, 'Show git status')
setnx('<leader>gS', Snacks.picker.git_stash, 'Show git stash')
setnx('<leader>gB', Snacks.picker.git_log_file, 'List buffers git commits')
setnx('<leader>gr', Snacks.picker.git_log_line, 'List buffers git commits over visual range')

setnx('<leader>n', require('nabla').popup, 'Show popup for nabla preview')
setnx('<leader>p', '"+p', 'Paste from system clipboard')
setnx('<leader>y', '"+y', 'Yank to system clipboard')

setnx('gs', '<Plug>(leap)', 'Activate leap')
setnx('g<C-s>', '<Plug>(leap-anywhere)', 'Activate leap anywhere')
setnx('gS', require('leap.remote').action, 'Activate remote leap')

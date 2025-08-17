local set = vim.keymap.set
local setnx = function(key, command, desc)
    set({'n', 'x'}, key, command, { desc = desc })
end
-- Telescope
local tele = require('telescope.builtin')
local telescope = require('telescope')

setnx('<leader>ff', tele.find_files, 'Find files')
setnx('<leader>f/', tele.grep_string, 'Search current word')
setnx('<leader>f?', tele.live_grep, 'Search in files')
setnx('<leader>fr', telescope.extensions.recent_files.pick, 'Find recent files')
setnx('<leader>b', tele.buffers, 'List buffers')
setnx('<leader>h', tele.help_tags, 'Search help')
setnx('<leader>m', tele.marks, 'Search marks')
setnx('<leader>q', tele.quickfix, 'Search quickfix list')
setnx('<leader>l', tele.loclist, 'Search location list')
setnx('<leader>j', tele.jumplist, 'Search jumplist')
setnx('<leader>r', tele.registers, 'Search registers')
setnx('<leader>s', tele.spell_suggest, 'List spelling suggestions')
setnx('<leader>M', tele.man_pages, 'Search man pages')
setnx('<leader>t', require'telescope-tabs'.list_tabs, 'List tabs')
setnx('<leader>c', tele.colorscheme, 'Select colorscheme')

setnx('<leader>op', '<CMD>Oil<CR>', 'Open file manager')
setnx('<leader>oP', '<CMD>Oil --float<CR>', 'Open file manager in floating window')
setnx('<leader>ot', '<CMD>term<CR>', 'Open terminal')
setnx('<leader>oT', '<CMD>tabnew<CR>', 'Open new tab')
setnx('<leader>of', '<CMD>enew<CR>', 'Open new file')
setnx('<leader>ow', '<CMD>Telescope workspaces', 'Open workspace')
setnx('<leader>ol', '<CMD>Lazy<CR>', 'Open Lazy')
setnx('<leader>om', '<CMD>Mason<CR>', 'Open Mason')
setnx('<leader>oc', '<CMD>cd' .. vim.fn.stdpath('config') .. '<CR><CMD>Oil<CR>', 'Open neovim configuration')

-- Exit terminal mode with ESC
set('t', '<Esc>', '<C-\\><C-n>')

-- Swap ' and `
setnx('\'', '`', 'Goto mark with column')
setnx('`', '\'', 'Goto mark without column')

setnx('grR', tele.lsp_references, 'Search lsp references')
setnx('grI', tele.lsp_incoming_calls, 'Find incoming function calls')
setnx('grO', tele.lsp_outgoing_calls, 'Find outgoing function calls')
setnx('grd', tele.diagnostics, 'Show LSP diagnostics')
setnx('grs', tele.lsp_workspace_symbols, 'Show workspace symbols')
setnx('grS', tele.lsp_document_symbols, 'Show document symbols')
setnx('gri', tele.lsp_implementations, 'Goto implementation')
setnx('gd', tele.lsp_definitions, 'Goto definition')
setnx('gD', tele.lsp_type_definitions, 'Goto type definition')

setnx('<leader>gc', tele.git_commits, 'List git commits')
setnx('<leader>gb', tele.git_branches, 'List git branches')
setnx('<leader>gs', tele.git_status, 'Show git status')
setnx('<leader>gS', tele.git_stash, 'Show git stash')
setnx('<leader>gB', tele.git_bcommits, 'List buffers git commits')
setnx('<leader>gr', tele.git_bcommits_range, 'List buffers git commits over visual range')

setnx('<leader>n', require('nabla').popup, 'Show popup for nabla preview')
setnx('<leader>p', '"+p', 'Paste from system clipboard')
setnx('<leader>y', '"+y', 'Yank to system clipboard')

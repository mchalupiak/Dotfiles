vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.showmode = false

vim.opt.smartindent = true

-- vim.opt.spell = true
vim.opt.spelllang = "en_us"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.g.mapleader = " "

vim.g.neovide_scale_factor = 1.0
vim.g.neovide_theme = 'auto'
vim.g.neovide_transparency = 1.0
function ChangeScaleFactor(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.keymap.set("n", "<C-=>", function()
    ChangeScaleFactor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
    ChangeScaleFactor(1 / 1.25)
end)

vim.opt.guifont = { "Iosevka Term SS12", ":h12" }
vim.opt.termguicolors = true

vim.g.netrw_keepdir = 0

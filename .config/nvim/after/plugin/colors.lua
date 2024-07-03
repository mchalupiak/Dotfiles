function colors(color)
	color = color or 'gruvbox'
    -- Available values:   `'hard'`, `'medium'`, `'soft'`
    vim.g.gruvbox_material_background = 'medium'
    -- Available values:   `'material'`, `'mix'`, `'original'`
    vim.g.gruvbox_material_foreground = 'mix'
    -- Available values:   `'hard'`, `'medium'`, `'soft'`
    vim.g.everforest_background = 'hard'
    vim.g.gruvbox_material_better_performance = 1
    vim.g.everforest_better_performance = 1
	vim.cmd.colorscheme(color)
end

colors()

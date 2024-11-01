function colors(color)
	color = os.getenv("BASE16_THEME")
    alt_color = 'rose-pine' or color
    -- Available values:   `'hard'`, `'medium'`, `'soft'`
    vim.g.gruvbox_material_background = 'medium'
    -- Available values:   `'material'`, `'mix'`, `'original'`
    vim.g.gruvbox_material_foreground = 'mix'
    -- Available values:   `'hard'`, `'medium'`, `'soft'`
    vim.g.everforest_background = 'hard'
    vim.g.gruvbox_material_better_performance = 1
    vim.g.everforest_better_performance = 1
	if not pcall(vim.cmd.colorscheme, color) then
        vim.cmd.colorscheme(alt_color)
    end
end

colors()

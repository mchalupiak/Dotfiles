function colors(color, theme)
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
    if color == 'gruvbox-dark-hard' then
        color = 'gruvbox-material'
        vim.g.gruvbox_material_background = 'hard'
    elseif color == 'gruvbox-dark-soft' then
        color = 'gruvbox-material'
        vim.g.gruvbox_material_background = 'soft'
    elseif color == 'everforest-dark-hard' then
        vim.g.everforest_background = 'hard'
        color = 'everforest'
    end
    if theme then
        vim.cmd.colorscheme(alt_color)
    elseif not pcall(vim.cmd.colorscheme, color) or color == nil then
        vim.cmd.colorscheme(alt_color)
    end
end

colors(nil, true)

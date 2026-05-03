vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/inlayHint') or client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                maxPreload = 100000,
                preloadFileSize = 100000,
            }
        }
    }
})

vim.lsp.config('tinymist', {
    settings = {
        exportPdf = "onType",
    },
})

vim.diagnostic.config({ update_in_insert = true, float = true, virtual_lines = true})

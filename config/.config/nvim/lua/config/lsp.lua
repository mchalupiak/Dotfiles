vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client:supports_method('textDocument/inlayHint') or client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end
})

-- vim.lsp.config('rust-analyzer', {
--     settings = {
--         ["rust-analyzer"] = {
--             inlayHints = {
--                 bindingModeHints = {
--                     enable = false,
--                 },
--                 chainingHints = {
--                     enable = true,
--                 },
--                 closingBraceHints = {
--                     enable = true,
--                     minLines = 25,
--                 },
--                 closureReturnTypeHints = {
--                     enable = "never",
--                 },
--                 lifetimeElisionHints = {
--                     enable = "never",
--                     useParameterNames = false,
--                 },
--                 maxLength = 25,
--                 parameterHints = {
--                     enable = true,
--                 },
--                 reborrowHints = {
--                     enable = "never",
--                 },
--                 renderColons = true,
--                 typeHints = {
--                     enable = true,
--                     hideClosureInitialization = false,
--                     hideNamedConstructor = false,
--                 },
--             },
--         }
--     }
-- })

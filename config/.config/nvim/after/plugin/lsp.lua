local lsp = require('lsp-zero')
local lsp_config = require("lspconfig")

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.html.setup {
    capabilities = capabilities,
    filetypes = { "html", "etlua" },
}

lsp_config.nim_langserver.setup{
    settings = {
        nim = {
            projectMapping = {
                projectFile = "main.nim",
                fileRegex = ".*\\.nim"
            }
        }
    }
}

lsp_config.hls.setup{}

lsp_config.clojure_lsp.setup{}

lsp_config.clangd.setup{}

lsp_config.sourcekit.setup{}

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup {
    sources = {
        { name = 'conjure' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }
}

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'LspAttached',
    once = true,
    callback = vim.lsp.codelens.refresh,
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	if client.name == "eslint" then
		vim.cmd.LspStop('eslint')
		return
	end
    if client.name == "html" or client.name == "cssls" then
        capabilities = capabilities
    end

    vim.api.nvim_create_autocmd({ 'TextChanged', 'InsertLeave' }, {
        buffer = bufnr,
        callback = vim.lsp.codelens.refresh,
    })
    -- trigger codelens refresh
    vim.api.nvim_exec_autocmds('User', { pattern = 'LspAttached' })


	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp_config.lua_ls.setup {
    -- ... other configs
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
lsp_config.racket_langserver.setup{}
lsp.setup()

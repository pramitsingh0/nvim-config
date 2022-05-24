local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    print("nvim_lsp_installer not found. Install it")
    return
end

-- Register a handler that will be called for all installed servers.
--
local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua", "tsserver", "pyright", "html", "cssls" }

lsp_installer.setup {
    ensure_installed = servers
}


for _, server in pairs(servers) do
    local opts = {
        on_attach = require("ps0.lsp.handlers").on_attach,
        capabilities = require("ps0.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "ps0.lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
    end
    lspconfig[server].setup(opts)
end

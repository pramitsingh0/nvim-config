local status, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status then
    return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("ps0.lsp.handlers").on_attach,
        capabilities = require("ps0.lsp.handlers").capabilities
    }
    server:setup(opts)
end)

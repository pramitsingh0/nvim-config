local status, _ = pcall(require, "lspconfig")

if not status then
    print("lsp not found")
    return
end

require("ps0.lsp.lsp-installer")
require("ps0.lsp.handlers").setup()

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("lspconfig not found. install nvim_lspconfig")
	return
end

require("ps0.lsp.lsp-installer")
require("ps0.lsp.handlers").setup()

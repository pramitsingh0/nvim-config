local status, onedark = pcall(require, "onedark")
if not status then
    vim.cmd "colorscheme default"
    vim.notify("Onedark Colorscheme not found")
    return
end
require('onedark').setup {
    style = 'darker'
}
require('onedark').load()
--require("onedarkpro").load()

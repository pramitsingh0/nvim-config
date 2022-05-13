local fn = vim.fn

-- Install packer if not found
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer restart neovim for changes to take effect"
    vim.cmd [[ packadd packer.nvim ]]
end

-- Autocmd that reload neovim wherever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]
-- Catch errors
local status, packer = pcall(require, "packer")
if not status then
    return
end
packer.init {
    display = {
        open_fn = function()
        return require("packer.util").float { border = 'rounded' }
        end,
    },
} 

-- Plugins Install
return packer.startup(function(use)
    -- plugins goes here
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "navarasu/onedark.nvim"
    use "olimorris/onedarkpro.nvim"

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

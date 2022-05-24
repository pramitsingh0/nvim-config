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
    print("packer not found. Install packer")
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
    use "lukas-reineke/indent-blankline.nvim"
    -- colorschemes
    use "navarasu/onedark.nvim"
    use 'marko-cerovac/material.nvim'

    -- cmp plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "windwp/nvim-autopairs"
    -- Code Snippets
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    -- fuzzy finder
    use "nvim-telescope/telescope.nvim"

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
        -- Is using a standard Neovim install, i.e. built from source or using a
    -- provided appimage.
    use 'lewis6991/impatient.nvim'

    -- Comments
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    -- use "lewis6991/gitsigns.nvim"
    --
    -- bufferline
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    -- lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- terminal
    use {"akinsho/toggleterm.nvim", tag = 'v1.*'}

    use 'norcalli/nvim-colorizer.lua'

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

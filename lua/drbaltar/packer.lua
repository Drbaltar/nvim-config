vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'folke/tokyonight.nvim'
    use { 'folke/trouble.nvim', requires = { "nvim-tree/nvim-web-devicons" } }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'theprimeagen/harpoon'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- Manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use "terrortylor/nvim-comment"
    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup()
        end
    })
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function ()
           require('nvim-autopairs').setup();
        end
    }
    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        -- install jsregexp (optional!:).
        run = "make install_jsregexp",
        requires = {
            "rafamadriz/friendly-snippets",
            'saadparwaiz1/cmp_luasnip'
        }
    })
    use {
        "benfowler/telescope-luasnip.nvim",
        module = "telescope._extensions.luasnip", -- if you wish to lazy-load
    }
    use "dmmulroy/tsc.nvim"
    use "danymat/neogen"
    use {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-treesitter/nvim-treesitter" }
        }
    }
    use 'rcarriga/nvim-notify'
    use { 'mfussenegger/nvim-jdtls', requires = { 'mfussenegger/nvim-dap' } }
    use 'folke/neodev.nvim'
    use { 'windwp/nvim-ts-autotag', requires = { "nvim-treesitter/nvim-treesitter" } }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
    use 'tpope/vim-fugitive'
    use { 'kristijanhusak/vim-dadbod-ui', requires = { 'tpope/vim-dadbod', 'kristijanhusak/vim-dadbod-completion' } }
    use 'vim-test/vim-test'
    use 'hsanson/vim-android'
end)

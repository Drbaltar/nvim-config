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
    use({
        "nvim-neotest/neotest",
        requires = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            'nvim-neotest/neotest-jest',
            "rcasia/neotest-java",
            "nvim-neotest/neotest-go",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require('neotest').setup({
                adapters = {
                    require('neotest-jest')({
                        jestCommand = "bun run test --",
                        jestConfigFile = "custom.jest.config.ts",
                        env = { CI = true },
                        cwd = function(_)
                            return vim.fn.getcwd()
                        end,
                    }),
                    require("neotest-java")({
                        ignore_wrapper = false,
                    }),
                    require("neotest-go")({
                        recursive_run = true
                    }),
                }
            })
        end
    })
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
        config = function()
            require("nvim-autopairs").setup {}
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
    use 'mfussenegger/nvim-jdtls'
    use 'folke/neodev.nvim'
end)

require'packer'.startup(
    function(use)
        -- common utilities
        use 'wbthomason/packer.nvim'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'kyazdani42/nvim-web-devicons'
        -- coloscheme
        use { "catppuccin/nvim", as = "catppuccin" }
        -- keymapping
        use 'folke/which-key.nvim'
        -- language servers
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'
        use 'tamago324/nlsp-settings.nvim'
        use 'jose-elias-alvarez/null-ls.nvim'
        use "lukas-reineke/lsp-format.nvim"
        use 'terrortylor/nvim-comment'
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use 'simrat39/rust-tools.nvim'
        use 'Saecki/crates.nvim'
        use 'lukoshkin/trailing-whitespace'
        -- syntax highlight
        use 'NoahTheDuke/vim-just'
        -- dap
        use 'mfussenegger/nvim-dap'
        -- autocompletion
        use {
            'hrsh7th/nvim-cmp',
            requires = {
                'L3MON4D3/LuaSnip',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-emoji',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-nvim-lua',
                'hrsh7th/cmp-path',
                'onsails/lspkind-nvim',
                'ray-x/cmp-treesitter',
                'saadparwaiz1/cmp_luasnip',
            },
        }
        use 'windwp/nvim-autopairs'
        -- others
        use 'nvim-lualine/lualine.nvim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-telescope/telescope-ui-select.nvim',
                'gbrlsnchs/telescope-lsp-handlers.nvim',
                'nvim-telescope/telescope-dap.nvim',
                {
                    'nvim-telescope/telescope-fzf-native.nvim',
                    run = 'make'
                },
            }
        }
        use 'kyazdani42/nvim-tree.lua'
        use 'akinsho/toggleterm.nvim'
        use 'lewis6991/gitsigns.nvim'
        use 'editorconfig/editorconfig-vim'
    end
)


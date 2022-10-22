call plug#begin('~/.nvim/plugged')
    " Editing
    Plug 'tpope/vim-surround'
    Plug 'mattn/emmet-vim'
    Plug 'numToStr/Comment.nvim'
    Plug 'windwp/nvim-autopairs'

    "Style
    Plug 'tomasiser/vim-code-dark'
    Plug 'Mofiqul/vscode.nvim'

    "Interface
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'goolord/alpha-nvim'
    Plug 'NvChad/nvim-colorizer.lua'

    
    
    Plug 'lukas-reineke/indent-blankline.nvim'

    " File Explorer
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

    " Session
    Plug 'olimorris/persisted.nvim'

    "LSP
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'neovim/nvim-lspconfig'
    Plug 'folke/lsp-colors.nvim'
    Plug 'RRethy/vim-illuminate'
    Plug 'stevearc/qf_helper.nvim'
    Plug 'folke/trouble.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    "Autocompletion
    " Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    " Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    " Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    "Plug 'OmniSharp/omnisharp-vim'

    "Search
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    "Formatting
    Plug 'mhartington/formatter.nvim'

    "Terminal
    Plug 'numToStr/FTerm.nvim'

    "Make
    Plug 'cdelledonne/vim-cmake'
    Plug 'onsails/lspkind.nvim'
call plug#end()

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Use 'dir' option to install plugin in a non-default directory
Plug('junegunn/fzf', { ['dir'] = '~/.fzf' })

-- Post-update hook: run a shell command after installing or updating the plugin
Plug('junegunn/fzf', { ['dir'] = '~/.fzf', ['do'] = './install --all' })

-- Post-update hook can be a lambda expression
Plug('junegunn/fzf', {
    ['do'] = function()
        vim.fn['fzf#install']()
    end
})

-- Color scheme
Plug 'morhetz/gruvbox'
Plug 'projekt0n/github-nvim-theme'

-- Autocompletion
--...
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

-- Autocompletion - luasnip
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-- Telescope
Plug 'nvim-lua/plenary.nvim'

Plug('nvim-treesitter/nvim-treesitter', {
    ['do'] = function()
        vim.fn[':TSUpdate']()
    end
})

Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

Plug 'sheerun/vim-polyglot'

Plug 'numToStr/Comment.nvim'

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

vim.call('plug#end')

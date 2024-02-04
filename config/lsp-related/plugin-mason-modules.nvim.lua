-- 放在 call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged') 和 call plug#end() 之间
local Plug = vim.fn['plug#']
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

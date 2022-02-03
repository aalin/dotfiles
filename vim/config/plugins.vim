let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'maximumtiu/true.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/file-line'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/SyntaxRange'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug '907th/vim-auto-save'
Plug 'alunny/pegjs-vim'
Plug 'aalin/animated-search-highlight.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'sunjon/shade.nvim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'alec-gibson/nvim-tetris'
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' " Icons without colours
Plug 'akinsho/bufferline.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'akinsho/toggleterm.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'folke/which-key.nvim'
call plug#end()

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1
let g:prettier#exec_cmd_async = 1

let g:mapleader = "\<Space>"

source ~/.vim/config/plugins.vim
source ~/.vim/config/settings.vim
source ~/.vim/config/filetypes.vim
source ~/.vim/config/mappings.vim
source ~/.vim/config/colors.vim

lua << EOF
require('lspconfig-mappings')
require('telescope-mappings')
require('setup/telescope')
require('setup/bufferline')
require('setup/colorizer')
require('setup/lspconfig')
require('setup/lualine')
require('setup/toggleterm')
require('setup/treesitter')
EOF

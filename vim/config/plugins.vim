let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/file-line'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elixir-lang/vim-elixir'
Plug 'fatih/vim-go'
Plug 'fatih/vim-nginx'
Plug 'vim-scripts/SyntaxRange'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-crystal'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'jparise/vim-graphql'
Plug 'alunny/pegjs-vim'
Plug 'LnL7/vim-nix'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomarrell/vim-npr'
call plug#end()

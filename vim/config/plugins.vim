if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
else
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/file-line'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/SyntaxRange'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'sheerun/vim-polyglot'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ap/vim-css-color'
Plug '907th/vim-auto-save'
Plug 'alunny/pegjs-vim'
call plug#end()

set nocompatible
set nobackup
set backspace=indent,eol,start
set ruler
set autoread

set scrolloff=3

set wildmenu
set wildmode=list:longest,full

set number
set autoindent
set tabstop=2
set shiftwidth=2

syntax on
filetype on
filetype plugin indent on

autocmd BufNewFile,BufRead *.rake  setf ruby

autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype cucumber   setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype cpp,c      setlocal ts=4 sts=4 sw=4
autocmd Filetype xml        setlocal ts=4 sts=4 sw=4

" Jump back to the last known position in the file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Non-breaking spaces to space
inoremap   <Space>

" Make non-breaking spaces red
highlight nbsp ctermbg=Red
match nbsp "[\xc2\xa0]"

let mapleader = ","
map <Leader>n :set hls!<return>

set title
autocmd BufEnter * let &titlestring=expand("%:t")

map <Space> i_<Esc>r

" Incremental searching
set incsearch
" Highlight search matches
set hlsearch
hi Search ctermfg=black ctermbg=yellow

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

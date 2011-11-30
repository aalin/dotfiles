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

autocmd BufNewFile,BufRead *.rake,Gemfile,Guardfile setf ruby
autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

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

let mapleader = ","
" Toggle search higlighting
map <Leader>n :set hlsearch!<return>
" Jump to .hpp-files from .cpp-files and vice versa.
map <Leader>h :new %:p:s/\.hpp$/\.X123X/:s/\.cpp$/\.hpp/:s/\.X123X$/\.cpp/<CR>

set title
autocmd BufEnter * let &titlestring=expand("%:t")

map <Space> i_<Esc>r
map <C-w>o <Nop>

" Incremental searching
set incsearch
" Highlight search matches
set hlsearch
hi Search ctermfg=black ctermbg=yellow
hi StatusLine cterm=NONE ctermbg=yellow ctermfg=black
hi StatusLineNC cterm=NONE ctermbg=white ctermfg=black

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

if has('persistent_undo')
  set undodir=~/.vim/undodir
  set undofile
  " Set maximum number of changes that can be undone
  set undolevels=1000
  " Set maximum number lines to save for undo on a buffer reload
  set undoreload=10000
end

call pathogen#infect()

set t_Co=256
colorscheme peachpuff

" Dark red
hi DiffText term=reverse cterm=bold ctermbg=88
" Dark blue
hi DiffChange term=bold ctermbg=17
" Dark gray, lighter gray
hi DiffDelete term=bold ctermbg=234 ctermfg=235
" Dark green
hi DiffAdd term=bold ctermbg=22

" Make non-breaking spaces red
autocmd BufNewFile,BufRead * highlight nbsp ctermbg=Red
autocmd BufNewFile,BufRead * match nbsp "[\xc2\xa0]"

autocmd BufNewFile,BufRead * highlight trailing_spaces ctermbg=Red
autocmd BufNewFile,BufRead * match trailing_spaces /\s\+$/

highlight StatusLine ctermfg=250 ctermbg=black
highlight StatusLineNC ctermfg=241 ctermbg=black

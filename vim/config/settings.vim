set nocompatible
set nobackup
set backspace=indent,eol,start
set ruler
set autoread

set scrolloff=3

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set cursorline

set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

set modeline
set modelines=5

set incsearch
set hlsearch

syntax on

" Gracefully handle holding shift too long after : for common commands
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev Tabe tabe
cabbrev Tabc tabc

" Jump back to the last known position in the file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set title
autocmd BufEnter * let &titlestring=expand("%:t")


let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

let g:rustfmt_autosave = 1

" Print highlighting scope at the current position.
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <leader>S :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set rtp+=/usr/local/opt/fzf
map <C-p> :FZF<CR>

autocmd CompleteDone * pclose " Hide preview window after autocomplete.

source ~/.vim/config/coc.vim

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
filetype plugin indent on

autocmd BufNewFile,BufRead *.rake,Gemfile,Guardfile setf ruby
autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype coffee     setlocal ts=2 sts=2 sw=2 expandtab
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
map <Leader><Leader> :set hlsearch!<CR>
" Jump to .hpp-files from .cpp-files and vice versa.
map <Leader>h :new %:p:s/\.hpp$/\.X123X/:s/\.cpp$/\.hpp/:s/\.X123X$/\.cpp/<CR>
map S :w<CR>

" Yank to OS X pasteboard.
noremap <Leader>y "*y

" Paste from OS X pasteboard without messing up indent.
noremap <Leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
noremap <Leader>P :set paste<CR>"*P<CR>:set nopaste<CR>

" Preserve selection when indenting stuff
vmap > >gv
vmap < <gv
" Indent using tab
vmap <Tab> >
vmap <S-Tab> <

vmap <Leader>t :s/\s\+$//<CR>

set title
autocmd BufEnter * let &titlestring=expand("%:t")

map <Space> i_<Esc>r
map <C-w>o <Nop>

" Incremental searching
set incsearch
" Highlight search matches
set hlsearch
hi Search ctermfg=black ctermbg=yellow
hi StatusLine cterm=none ctermbg=yellow ctermfg=black
hi StatusLineNC cterm=none ctermbg=white ctermfg=black

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

call pathogen#infect()

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set cursorline
hi CursorLine cterm=none ctermbg=235

let g:syntastic_quiet_warnings=1
let g:syntastic_auto_loc_list=1
highlight SyntasticError ctermbg=darkblue ctermfg=white

" Fix arrow keys in Command-T
map <Esc>[B <Down>

" Make non-breaking spaces red
autocmd BufNewFile,BufRead * highlight nbsp ctermbg=Red
autocmd BufNewFile,BufRead * match nbsp "[\xc2\xa0]"

autocmd BufNewFile,BufRead * highlight trailing_spaces ctermbg=Red
autocmd BufNewFile,BufRead * match trailing_spaces /\s\+$/

highlight StatusLine ctermfg=250 ctermbg=black
highlight StatusLineNC ctermfg=241 ctermbg=black

" Print highlighting scope at the current position.
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
map <leader>S :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" iTerm2.
" Change cursor shape in insert mode.
" http://www.iterm2.com/#/section/documentation/escape_codes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

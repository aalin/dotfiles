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

set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

set modeline
set modelines=5

syntax on
filetype plugin indent on

autocmd BufNewFile,BufRead *.rake,Gemfile,Guardfile setf ruby
autocmd BufNewFile,BufRead *.slim setf slim
autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
autocmd BufNewFile,BufRead *.jbuilder,*.jpbuilder setf ruby
autocmd BufNewFile,BufRead *_spec.rb setf rspec
autocmd BufNewFile,BufRead *.re setf cpp
autocmd BufNewFile,BufRead *.y setf lemon

autocmd Filetype cpp,c,re setlocal ts=4 sts=4 sw=4 noexpandtab

" Insert header guards, http://vim.wikia.com/wiki/Automatic_insertion_of_C/C%2B%2B_header_gates
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename
  execute "normal! Go#endif"
  normal! ko
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" Gracefully handle holding shift too long after : for common commands
cabbrev W w
cabbrev Q q
cabbrev Wq wq
cabbrev Tabe tabe
cabbrev Tabc tabc

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
call plug#end()

let g:rustfmt_autosave = 1

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set cursorline
hi CursorLine cterm=none ctermbg=235

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

set rtp+=/usr/local/opt/fzf
map <C-p> :FZF<CR>

autocmd CompleteDone * pclose " Hide preview window after autocomplete.

set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

highlight Normal ctermfg=248 ctermbg=234

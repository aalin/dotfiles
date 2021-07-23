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

" Press space to insert 1 character
map <Space> i_<Esc>r
map <C-w>o <Nop>

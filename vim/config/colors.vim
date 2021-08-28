set background=dark
let g:solarized_termcolors=256
colorscheme solarized8

hi Search ctermfg=black ctermbg=yellow
"hi StatusLine cterm=none ctermbg=yellow ctermfg=black
"hi StatusLineNC cterm=none ctermbg=white ctermfg=black
hi StatusLine ctermfg=250 ctermbg=black
hi StatusLineNC ctermfg=241 ctermbg=black

" Increase contrast
highlight Normal ctermfg=248 ctermbg=234 guifg=#dddddd guibg=#001d25
highlight LineNr guibg=#052933

set cursorline
highlight CursorLine cterm=none ctermbg=235 guibg=#052933

" Make non-breaking spaces red
autocmd BufNewFile,BufRead * highlight nbsp ctermbg=Red
autocmd BufNewFile,BufRead * match nbsp "[\xc2\xa0]"

autocmd BufNewFile,BufRead * highlight trailing_spaces ctermbg=Red
autocmd BufNewFile,BufRead * match trailing_spaces /\s\+$/

hi IndentGuidesEven ctermbg=235
hi IndentGuidesOdd ctermbg=234

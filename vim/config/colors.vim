autocmd BufNewFile,BufRead * match NonBreakingSpace "[\xc2\xa0]"
autocmd BufNewFile,BufRead * match TrailingSpaces /\s\+$/

function SetupColorOverrides() abort
  highlight Search ctermfg=black ctermbg=yellow

  highlight StatusLine ctermfg=250 ctermbg=black
  highlight StatusLineNC ctermfg=241 ctermbg=black

  " Increase contrast
  highlight Normal ctermfg=248 ctermbg=234 guifg=#dddddd guibg=#001d25
  highlight LineNr guibg=#052933

  highlight CursorLine cterm=none ctermbg=235 guibg=#052933

  highlight IndentGuidesEven ctermbg=235
  highlight IndentGuidesOdd ctermbg=234

  highlight NonBreakingSpace ctermbg=Red
  highlight TrailingSpaces ctermbg=Red
endfunction

augroup ColorOverrides
  autocmd!
  autocmd ColorScheme * call SetupColorOverrides()
augroup END

set background=dark
let g:solarized_termcolors=256
colorscheme solarized8

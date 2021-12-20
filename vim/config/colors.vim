autocmd BufNewFile,BufRead * match NonBreakingSpace "[\xc2\xa0]"
autocmd BufNewFile,BufRead * match TrailingSpaces /\s\+$/

function SetupColorOverrides() abort
  let l:colorscheme=get(g:, 'colors_name', 'default')

  if l:colorscheme == "solarized8"
    highlight Search ctermfg=black ctermbg=yellow

    highlight StatusLine ctermfg=250 ctermbg=black
    highlight StatusLineNC ctermfg=241 ctermbg=black

    " Increase contrast
    highlight Normal ctermfg=248 ctermbg=234 guifg=#dddddd guibg=#001d25
    highlight LineNr guibg=#052933

    highlight CursorLine cterm=none ctermbg=235 guibg=#052933

    highlight IndentGuidesEven ctermbg=235
    highlight IndentGuidesOdd ctermbg=234
  endif

  if l:colorscheme == "true"
    highlight CursorLine cterm=none ctermbg=235 guibg=#3a2143
  endif

  if l:colorscheme == "srcery"
    highlight Search guibg=#ffcc00 guifg=#000000
    highlight IncSearch guibg=#fff677 guifg=#000000
  endif

  highlight NonBreakingSpace ctermbg=Red
  highlight TrailingSpaces ctermbg=Red
endfunction

augroup ColorOverrides
  autocmd!
  autocmd ColorScheme * call SetupColorOverrides()
augroup END

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
  set pumblend=30
  set winblend=30
else
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
colorscheme srcery

let g:lightline = {
\ 'colorscheme': 'default',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead',
\   'cocstatus': 'coc#status',
\ },
\ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

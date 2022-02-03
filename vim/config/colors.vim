function SetupMatches() abort
  match NonBreakingSpace "[\xc2\xa0]"
  match LongLine '\%>79v.\+'
endfunction

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
    highlight CursorLine guibg=#252421
  endif

  highlight NonBreakingSpace ctermbg=Red

  " Transparent background
  highlight Normal ctermbg=none guibg=none
  highlight NonText ctermbg=none guibg=none
  highlight SignColumn ctermbg=none guibg=none
  highlight NormalNC ctermbg=none guibg=none
  highlight MsgArea ctermbg=none guibg=none
  highlight TelescopeBorder ctermbg=none guibg=none
  highlight NvimTreeNormal ctermbg=none guibg=none

  highlight LongLine guibg=#470a03
endfunction

augroup ColorOverrides
  autocmd!
  autocmd ColorScheme * call SetupColorOverrides()
  autocmd BufNewFile,BufRead * call SetupMatches()
augroup END

match LongLine80 '\%>80v.\+'
highlight LongLine80 guibg=#470a03

set termguicolors

if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set pumblend=30
  set winblend=30
else
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if exists('g:started_by_firenvim')
  set guifont=PragmataPro:h20
else
  set guifont=PragmataPro:h14
endif

set background=dark
colorscheme srcery

set noshowmode " hide mode because lightline will show it anyways

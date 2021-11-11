" Insert header guards, http://vim.wikia.com/wiki/Automatic_insertion_of_C/C%2B%2B_header_gates
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename
  execute "normal! Go#endif"
  normal! ko
endfunction

autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal smarttab
setlocal noexpandtab
setlocal autoindent

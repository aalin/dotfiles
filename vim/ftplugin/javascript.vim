function! ResolveModulePath(fname)
  if v:fname !~ '^\~\/'
    return v:fname
  endif

  let rootRelativePath = substitute(v:fname, '^\~\/', '/src/', '')

  for folder in g:WorkspaceFolders
    let resolvedPath = folder . rootRelativePath

    for filename in ["", "/".fnamemodify(v:fname, ":t"), "/index"]
      for suffix in [".js", ".jsx", ".ts", ".tsx"]
        let path = resolvedPath . filename . suffix

        if filereadable(path)
          return path
        endif
      endfor
    endfor
  endfor

  return v:fname
endfunction

set includeexpr=ResolveModulePath(v:fname)

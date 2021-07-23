filetype plugin indent on

autocmd BufNewFile,BufRead *.rake,Gemfile,Guardfile setf ruby
autocmd BufNewFile,BufRead *.slim setf slim
autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl
autocmd BufNewFile,BufRead *.jbuilder,*.jpbuilder setf ruby
autocmd BufNewFile,BufRead *_spec.rb setf rspec
autocmd BufNewFile,BufRead *.re setf cpp
autocmd BufNewFile,BufRead *.y setf lemon

autocmd Filetype cpp,c,re setlocal ts=4 sts=4 sw=4 noexpandtab

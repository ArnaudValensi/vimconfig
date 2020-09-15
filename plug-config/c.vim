function! Formatonsave()
  let l:formatdiff = 1
  py3file /usr/local/Cellar/clang-format/2019-01-18/share/clang/clang-format.py
endfunction

augroup c_commands
  autocmd!

  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
  autocmd BufWritePre *.h,*.c call Formatonsave()
  autocmd FileType c noremap <Leader>oo :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
  autocmd FileType c noremap <Leader>ov :vs %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
  autocmd FileType c noremap <Leader>oh :sp %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
  autocmd FileType c noremap cc :make run<CR>
  autocmd FileType c noremap <Leader>gd :YcmCompleter GoTo<CR>
  autocmd FileType c noremap <Leader>gi <C-]>
  autocmd FileType c noremap <Leader>gn :tn<CR>
  autocmd FileType c noremap <Leader>gp :tp<CR>
  " autocmd FileType c noremap <Leader>oc :e %<.c<CR>
  " autocmd FileType c noremap <Leader>oh :e %<.h<CR>
augroup END


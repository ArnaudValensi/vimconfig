setlocal shiftwidth=4

nnoremap <leader>ul yiwodebug(");
vnoremap <leader>ul yodebug(");
let g:which_key_map.u.l = 'print variable at cursor'

set foldmethod=indent
" set nofoldenable " Disable folding at startup.

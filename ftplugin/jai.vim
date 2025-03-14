setlocal shiftwidth=4

" nnoremap <leader>ul yiwodebug(");
" vnoremap <leader>ul yodebug(");
nnoremap <leader>ul yiwoprintln("": %", ");
vnoremap <leader>ul yoprintln("": %", ");
let g:which_key_map.u.l = 'print variable at cursor'

set foldmethod=indent
" set nofoldenable " Disable folding at startup.

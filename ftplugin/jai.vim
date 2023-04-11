setlocal shiftwidth=4

nnoremap <leader>ul yiwoprint("": %\n", ");
vnoremap <leader>ul yoprint("": %\n", ");
let g:which_key_map.u.l = 'print word at cursor'

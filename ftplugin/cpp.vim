set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" set nofoldenable " Disable folding at startup.

nnoremap <leader>ul yiwoprintln("": {}", ");
vnoremap <leader>ul yoprintln("": {}", ");
let g:which_key_map.u.l = 'println word at cursor'

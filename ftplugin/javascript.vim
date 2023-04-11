setlocal commentstring=//\ %s
" setlocal foldmethod=syntax

" Add the following with the word under the cursor:
" console.log('world:', JSON.stringify(world, null, 2));
nnoremap <leader>ul yiwoconsole.log('": ', JSON.stringify(", null, 2));
vnoremap <leader>ul yoconsole.log('": ', JSON.stringify(", null, 2));
let g:which_key_map.u.l = 'console.log word at cursor'

nmap <leader>uc :%s/^ *console\.log(.*$\n//gc<cr>
let g:which_key_map.u.c = 'clear console.log'

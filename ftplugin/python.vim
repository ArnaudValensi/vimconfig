" nnoremap <leader>ul yiwoprint(dumps(", indent=4))
" vnoremap <leader>ul yoprint(dumps(", indent=4))
nnoremap <leader>ul yiwoprint(f"": {"}")
vnoremap <leader>ul yoprint(f"": {"}")
let g:which_key_map.u.l = 'dumps word at cursor'

let g:dash_map = {
    \ 'cpp' : ['doxygen', 'cpp', 'c', 'manpages']
    \ }

let g:zv_zeal_executable = '/mnt/c/Program Files/Zeal/zeal.exe'
let g:zv_file_types = {
            \   'zig'                : 'zig,SDL',
            \   'cpp'                : 'cpp,SDL',
            \   'jai'                : 'SDL',
            \ }

if has("mac")
    nnoremap <leader>z <Plug>DashSearch
    vnoremap <leader>z <Plug>DashSearch
else
    nmap <leader>z <Plug>Zeavim
    vmap <leader>z <Plug>ZVVisSelection
endif

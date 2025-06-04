let g:dash_map = {
    \ 'cpp' : ['doxygen', 'cpp', 'c', 'manpages']
    \ }

let g:zv_zeal_executable = '/mnt/c/Program Files/Zeal/zeal.exe'
let g:zv_file_types = {
            \   'zig'                : 'zig,doxy',
            \   'cpp'                : 'cpp,doxy',
            \   'jai'                : 'doxy,glsl',
            \ }
" doxy is for SDL for some reason.

let g:zv_get_docset_by = ['ft']

if has("mac")
    nnoremap <leader>z <Plug>DashSearch
    vnoremap <leader>z <Plug>DashSearch
else
    nmap <leader>z <Plug>Zeavim
    vmap <leader>z <Plug>ZVVisSelection
endif

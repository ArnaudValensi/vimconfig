" command! RunGame split | terminal jai.exe build.jai - build && ./build/game.exe
" command! RunGame vsplit | terminal jai.exe build.jai - build && ./build/game.exe
" command! DebugGame vsplit | terminal jai.exe build.jai - build && remedybg.exe -g -q ./build/game.exe

augroup NonosProjectSettings
  autocmd!
  autocmd BufEnter /mnt/d/dev-2/oob/repos/oob-jai/** set makeprg=/mnt/d/dev-2/oob/repos/oob-jai/tools/wsl_neovim_compile.sh
  autocmd BufEnter /mnt/d/dev-2/oob/repos/oob-jai/** set errorformat=%f:%l\\,%c:\ Error:\ %m,%f:%l\\,%c:\ %m,%m\ (%f:%l)
  autocmd BufEnter /mnt/d/dev-2/oob/repos/oob-jai/** noremap <Leader>a :CompileAndDebug<cr>
augroup END

function! CompileAndDebugFunc()
    " Run the make command and check for success
    make

    " This doesn't work, make command do not return the error code.
    " echo 'Shell error: ' . v:shell_error
    " if v:shell_error == 0 " If make was successful, v:shell_error will be 0

    if !filereadable("/tmp/has_error")
        " Run the game executable
        " silent !./build/game.exe
        silent !remedybg.exe -g -q ./build/game.exe
    endif
endfunction

command! CompileAndDebug call CompileAndDebugFunc()

augroup NonosProjectSettings
  autocmd!
  autocmd BufEnter /mnt/c/Users/arnau.DESKTOP-2ODO5PA/dev/nonos-toolkit/repos/nonos-toolkit/** set makeprg=mingw32-make.exe
  autocmd BufEnter /mnt/c/Users/arnau.DESKTOP-2ODO5PA/dev/nonos-toolkit/repos/nonos-toolkit/** noremap <Leader>a :Neomake!<cr>
augroup END

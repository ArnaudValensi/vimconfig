augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving
  " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>ci :OmniSharpFindImplementations<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>cs :OmniSharpFindSymbol<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>cu :OmniSharpFindUsages<CR>

  " Finds members in the current buffer
  autocmd FileType cs nnoremap <buffer> <Leader>cm :OmniSharpFindMembers<CR>

  autocmd FileType cs nnoremap <buffer> <Leader>cv :OmniSharpFixUsings<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>ct :OmniSharpTypeLookup<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>cd:OmniSharpDocumentation<CR>
  autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
  autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

  " Navigate up and down by method/property/field
  autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
  autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nnoremap <buffer> <Leader>cg :OmniSharpGlobalCodeCheck<CR>

  " Rename with dialog
  autocmd FileType cs nnoremap <buffer> <Leader>cr :OmniSharpRename<CR>

  " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
  autocmd FileType cs nnoremap <buffer> <Leader>ca :OmniSharpGetCodeActions<CR>
  " Run code actions with text selected in visual mode to extract method
  autocmd FileType cs xnoremap <buffer> <Leader>ca :call OmniSharp#GetCodeActions('visual')<CR>

  autocmd FileType cs nnoremap <buffer> <Leader>cf :OmniSharpCodeFormat<CR>

  autocmd FileType cs nnoremap <buffer> <Leader>cc :make<CR>
  autocmd FileType cs nnoremap <buffer> <Leader>cx :make test-vim<CR>

  autocmd FileType cs autocmd BufWritePre <buffer> OmniSharpCodeFormat

  " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
  autocmd FileType cs command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

  " Start the omnisharp server for the current solution
  autocmd FileType cs nnoremap <Leader>ss :OmniSharpStartServer<CR>
  autocmd FileType cs nnoremap <Leader>sp :OmniSharpStopServer<CR>
augroup END


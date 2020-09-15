let g:mapleader = "\<Space>"

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" To find, do * or # for backward
" Unhighlight by pusing escape keys twice.
nnoremap <esc><esc> :nohlsearch<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Use alt + hjkl to resize windows.
nnoremap <M-j> :resize -3<CR>
nnoremap <M-k> :resize +3<CR>
nnoremap <M-h> :vertical resize -3<CR>
nnoremap <M-l> :vertical resize +3<CR>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> ]q :cnext<cr>
nnoremap <silent> [q :cprevious<cr>
nnoremap <silent> ]Q :clast<cr>
nnoremap <silent> [Q :cfirst<cr>
nnoremap <silent> ]l :lnext<cr>
nnoremap <silent> [l :lprevious<cr>
nnoremap <silent> ]L :llast<cr>
nnoremap <silent> [L :lfirst<cr>

" Stamp
" https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text
" nnoremap S ciw<C-r>0<Esc>
" vnoremap S "_d"0P

" Delete a char right to the cursor.
inoremap <C-D> <C-O>x

" Search:
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
nmap <Leader>* <Plug>RgRawWordUnderCursor

"*****************************************************************************
" coc.vim
"*****************************************************************************
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> for trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" nnoremap <leader>dp <Plug>(coc-diagnostic-prev)
" nnoremap <leader>dn <Plug>(coc-diagnostic-next)
" nnoremap <leader>dl :CocList diagnostics<cr>

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K for show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

"*****************************************************************************
" Git
"*****************************************************************************
" noremap <Leader>ga :Gwrite<CR>
" noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
" noremap <Leader>gs :Gstatus<CR>
" noremap <Leader>gb :Gblame<CR>
" noremap <Leader>gd :Gvdiff<CR>
" noremap <Leader>gr :Gremove<CR>

"*****************************************************************************
" OmniSharp
"*****************************************************************************
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


"*****************************************************************************
" C
"*****************************************************************************
function! Formatonsave()
  let l:formatdiff = 1
  py3file /usr/local/Cellar/clang-format/2019-01-18/share/clang/clang-format.py
endfunction

augroup c_commands
  autocmd!

  autocmd BufRead,BufNewFile *.h,*.c set filetype=c
  autocmd BufWritePre *.h,*.c call Formatonsave()
  autocmd FileType c noremap <Leader>oo :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
  autocmd FileType c noremap <Leader>ov :vs %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
  autocmd FileType c noremap <Leader>oh :sp %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
  autocmd FileType c noremap cc :make run<CR>
  autocmd FileType c noremap <Leader>gd :YcmCompleter GoTo<CR>
  autocmd FileType c noremap <Leader>gi <C-]>
  autocmd FileType c noremap <Leader>gn :tn<CR>
  autocmd FileType c noremap <Leader>gp :tp<CR>
  " autocmd FileType c noremap <Leader>oc :e %<.c<CR>
  " autocmd FileType c noremap <Leader>oh :e %<.h<CR>
augroup END

"*****************************************************************************
" YouCompleMe/UltiSnip
"*****************************************************************************
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion=["<tab>"]
let g:ycm_key_list_previous_completion=["<S-tab>"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsExpandTrigger="<NUL>"
let g:ulti_expand_or_jump_res = 0
function! <SID>ExpandSnippetOrReturn()
  let snippet = UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res > 0
    return snippet
  else
    return "\<CR>"
  endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "\<CR>"

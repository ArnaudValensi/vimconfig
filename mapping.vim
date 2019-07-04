let g:mapleader = "\<Space>"
nnoremap <silent> <leader><space> :Buffers<CR>
nnoremap <silent> <leader>bd :bp\|bd #<CR>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>a :Ag 
nnoremap <leader>r :Rg 
nnoremap <leader>q :q<cr>
" fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <leader>vc :Commands<cr>

" To find, do * or # for backward
" Unhighlight by pusing escape keys twice.
nnoremap <esc><esc> :nohlsearch<cr>

" Edit window, edit split, edit vertical (split), edit tabe.
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>eh :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" :edit <filename>: Open a file.
" :edit %:h <filename>: Open a file in current directory.
" :edit %% <filename>: Open a file in current directory.

" Tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>tc :tabclose<cr>

" Split
noremap <Leader>wh :<C-u>split<CR>
noremap <Leader>wv :<C-u>vsplit<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT

" <C-w>s: Split the current window horizontally, reusing the current buffer in the new window.
" <C-w>v: Split the current window vertically, reusing the current buffer in the new window.
" <C-w>w: Cycle between open window.
" <C-w>h: Focus the window to the left.
" <C-w>j: Focus the window below.
" <C-w>k: Focus the window above.
" <C-w>l: Focus the window to the right.
" :clo[se] <C-w>c: Close the active window.
" :on[ly] <C-w>o: Keep only the active window, closing all others.
" <C-w>=: Equalize width and height of all windows.
" <C-w>_: Maximize height of the active window.
" <C-w>|: Maximize width of the active window.
"
" :tab split: Open the current window into a new tab
"   
" + and * anre the system clipboard register.
" "+p: To paste from the clipboard.
" "+yy: To copy the current line in system clipboard.
" <C-r>+: To paste from clipboard in insert mode.
"
" TODO: Add map to move to windows: <leader>s[hjkl] for example.

" Movements:
" <S-{>, <S-}>: Move by block.
" zt, zz, zb: puts current line top, center, bottom.

" Delete a char right to the cursor.
inoremap <C-D> <C-O>x

" Search:
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
nmap <Leader>* <Plug>RgRawWordUnderCursor

" Zoom
noremap Zi <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

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
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"*****************************************************************************
" NERDTree
"*****************************************************************************
nnoremap <leader>tf :NERDTreeFind<CR>
noremap <leader>tt :NERDTreeToggle<CR>

"*****************************************************************************
" Config files
"*****************************************************************************

nnoremap <leader>vi :vsplit $HOME/.config/nvim/init.vim<cr>
nnoremap <leader>vm :vsplit $HOME/.config/nvim/mapping.vim<cr>
nnoremap <leader>vs :vsplit $HOME/.config/nvim/settings.vim<cr>
nnoremap <leader>vp :vsplit $HOME/.config/nvim/plugins.vim<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>

"*****************************************************************************
" Config files
"*****************************************************************************
augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>ci :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>cm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>cx :OmniSharpFixUsings<CR>
    " autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>cd:OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>

    " Rename with dialog
    autocmd FileType cs nnoremap <buffer> <Leader>cr :OmniSharpRename<CR>

    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <buffer> <Leader>ca :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs xnoremap <buffer> <Leader>ca :call OmniSharp#GetCodeActions('visual')<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>cf :OmniSharpCodeFormat<CR>
augroup END

" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

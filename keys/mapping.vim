let g:mapleader = "\<Space>"

" TAB in general mode will move to text buffer
" nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
" nnoremap <silent> <S-TAB> :bprevious<CR>

" <tab> and <c-i> are sending the same key. To fix this, <c-i> is bound to
" <c-n>i and iterm and alacritty are sending <c-n>i when doing <c-i>
" See https://vi.stackexchange.com/a/25015
" nnoremap <C-n>i <C-i>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" To find, do * or # for backward
" Unhighlight by pusing escape keys twice.
nnoremap <silent> <esc><esc> :nohlsearch<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <S-H> 0
nnoremap <S-L> $

" nnoremap <C-W>l :vsplit<cr>
" nnoremap <C-W>h :vsplit<cr>
" nnoremap <C-W>j :split<cr>
" nnoremap <C-W>k :split<cr>

" Use alt + hjkl to resize windows.
" nnoremap <M-j> :resize -3<CR>
" nnoremap <M-k> :resize +3<CR>
" nnoremap <M-h> :vertical resize -3<CR>
" nnoremap <M-l> :vertical resize +3<CR>

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

" Delete a char right to the cursor.
inoremap <C-D> <C-O>x

" Search:
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
nmap <Leader>* <Plug>RgRawWordUnderCursor

noremap <silent> <C-s> :wa<CR>
inoremap <silent> <C-s> <ESC>:wa<CR>a

" Escape from terminal insert mode
tnoremap <leader><Esc> <C-\><C-n>

nnoremap <leader>% :source %<cr>

" vim-cutlass
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" vim-yoink
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

" vim-subversive
xmap p <plug>(SubversiveSubstitute)
xmap P <plug>(SubversiveSubstitute)
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

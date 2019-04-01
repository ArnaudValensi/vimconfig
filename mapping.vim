let g:mapleader = "\<Space>"
nnoremap <silent> <leader><space> :Buffers<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <leader>f :Files<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>s :Ag<cr>
nnoremap <leader>q :q<cr>

" To find, do * or # for backward
" Unhighlight by pusing escape keys twice.
nnoremap <esc><esc> :nohlsearch<cr>

" Edit window, edit split, edit vertical (split), edit tabe.
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" :edit <filename>: Open a file.
" :edit %:h <filename>: Open a file in current directory.
" :edit %% <filename>: Open a file in current directory.

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

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

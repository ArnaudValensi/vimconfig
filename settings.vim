" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set smarttab               " Makes tabbing smarter will realize you have 2 vs 4
set expandtab              " Converts tabs to spaces
set smartindent            " Makes indenting smart
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 2 spaces.
set shiftwidth  =2         " >> indents by 2 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.
set signcolumn=yes         " Always show signcolumns.

set clipboard=unnamedplus  " Share the default register with the clipboard.
set mouse=a                " Enable your mouse

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:~'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.,trail:~'
endif

" create directory if needed
if !isdirectory($HOME.'/.vim/files') && exists('*mkdir')
  call mkdir($HOME.'/.vim/files')
endif

" backup files
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
" swap files
set directory   =$HOME/.vim/files/swap/
set updatecount =100
" undo files
set undofile
set undodir     =$HOME/.vim/files/undo/
" viminfo files
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

" auto read file on external change
set autoread

let g:dracula_colorterm = 0
colorscheme dracula

set colorcolumn=100
" set timeoutlen=1000
" set ttimeoutlen=0

set number

set langmenu=en_US.UTF-8
language en_US.UTF-8

" Imrpove update speed of some stuff like git-gutter (100ms instead of delaut 4000ms)
set updatetime=100

" When using `dd` in the quickfix list, remove the item from the quickfix list.
" Found here https://github.com/JesseLeite/dotfiles/blob/54fbd7c5109eb4a8e8a9d5d3aa67affe5c18efae/.vimrc#L444-L456
" https://stackoverflow.com/questions/42905008/quickfix-list-how-to-add-and-remove-entries
function! RemoveQuickfixItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction

" git mappings
" nmap <leader>gb :Gblame<CR>
" nmap <leader>gs :Gstatus<CR>
" nmap <leader>gc :Gcommit<CR>
" nmap <leader>gph :Gpush<CR>
" nmap <leader>gpl :Gpull<CR>

" gui colors if running iTerm
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

augroup Misc
  autocmd!

  autocmd FileType qf map <buffer> dd :call RemoveQuickfixItem()<cr>j

  " Remove trailing whitespaces.
  autocmd FileType cs,js,make autocmd BufWritePre <buffer> %s/\s\+$//e

  " Set comment style
  autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

  autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 expandtab
augroup END
"*****************************************************************************
" fzf
" TODO: Add this config for AgRaw and RgRaw,
"*****************************************************************************

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Likewise, Files command with preview window
" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>,
"   \                    fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                    <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"*****************************************************************************
" coc-prettier
"*****************************************************************************
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

"*****************************************************************************
" OmniSharp
"*****************************************************************************
" Use the stdio version of OmniSharp-roslyn:
let g:OmniSharp_server_stdio = 1
" use the installed Mono on the system.
let g:OmniSharp_server_use_mono = 0

let g:OmniSharp_server_path = '/Users/arnaud/dev/tools/omnisharp-osx-1.32.20/run'

" Highlight on BufEnter and InsertLeave
let g:OmniSharp_highlight_types = 2

let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Update symantic highlighting on BufEnter and InsertLeave
let g:OmniSharp_highlight_types = 2

"*****************************************************************************
" ALE
"*****************************************************************************
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

""*****************************************************************************
"" Asyncomplete
""*****************************************************************************
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

"imap <leader><Tab> <Plug>(asyncomplete_force_refresh)

"" Don't autoselect first omnicomplete option, show options even if there is only
"" one (so the preview documentation is accessible). Remove 'preview' if you
"" don't want to see any documentation whatsoever.
"set completeopt=menuone,noinsert,noselect,preview
"" Disable comleteopt overriding.
"let g:asyncomplete_auto_completeopt = 0

"let g:asyncomplete_auto_popup = 1

"autocmd CompleteDone * pclose

""*****************************************************************************
"" Neosnippet
""*****************************************************************************
"call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
"    \ 'name': 'neosnippet',
"    \ 'whitelist': ['*'],
"    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
"    \ }))

"imap <C-e>     <Plug>(neosnippet_expand_or_jump)
"smap <C-e>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-e>     <Plug>(neosnippet_expand_target)

"*****************************************************************************
" Airline
"*****************************************************************************
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:bufferline_echo = 0

"*****************************************************************************
" C#
"*****************************************************************************
" autocmd FileType cs compiler xbuild
autocmd FileType cs setlocal errorformat=\ %#%f(%l\\\,%c):\ %m
" autocmd FileType cs setlocal errorformat=\▸%#at:\ %#'%f:%l:%c

"*****************************************************************************
" Quickfix list
"*****************************************************************************
" From https://vim.fandom.com/wiki/Automatically_open_the_quickfix_window_on_:make
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

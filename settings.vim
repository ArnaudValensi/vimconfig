" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
" We set it explicitely to make our position clear!
set nocompatible

let g:node_host_prog = expand("~/.fnm/node-versions/v16.15.0/installation/lib/node_modules/neovim/bin/cli.js")
let g:coc_node_path = expand("~/.fnm/node-versions/v16.15.0/installation/bin/node")

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

set foldlevel=99           " Default fold level.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±,trail:~'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.,trail:~'
endif

" create directory if needed
if !isdirectory($HOME.'/.vim') && exists('*mkdir')
  call mkdir($HOME.'/.vim')
endif
if !isdirectory($HOME.'/.vim/files') && exists('*mkdir')
  call mkdir($HOME.'/.vim/files')
endif

" Backup files.
" set backup
" set backupdir   =$HOME/.vim/files/backup/
" set backupext   =-vimbackup
" set backupskip  =

" coc: Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Swap files.
set directory   =$HOME/.vim/files/swap//
set updatecount =100
" Add :DiffOrig command to diff with swap.
command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_
  \ | diffthis | wincmd p | diffthis

" Undo files.
set undofile
set undodir     =$HOME/.vim/files/undo/
" Viminfo files.
set viminfo     ='100,n$HOME/.vim/files/info/viminfo

" Auto read file on external change.
set autoread

let g:dracula_colorterm = 0
colorscheme dracula

set colorcolumn=100
" set timeoutlen=1000
" set ttimeoutlen=0

set number relativenumber

set langmenu=en_US.UTF-8
language en_US.UTF-8

" Imrpove update speed of some stuff like git-gutter (100ms instead of delaut 4000ms)
set updatetime=100

" Gui colors if running iTerm.
" TODO: Check if it is Windows' Terminal or Kitty.
if $TERM_PROGRAM =~ "iTerm"
  set termguicolors
endif

augroup Misc
  autocmd!

  " Remove trailing whitespaces.
  autocmd FileType cs,js,make autocmd BufWritePre <buffer> %s/\s\+$//e

  " Set comment style
  autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

  autocmd FileType cs setlocal shiftwidth=4 softtabstop=4 expandtab

  " Fix treesitter folding not working when file opened with Telescope.
  " See:
  " - https://github.com/nvim-telescope/telescope.nvim/issues/699#issuecomment-1159637962
  " - https://github.com/nvim-treesitter/nvim-treesitter/issues/1337#issuecomment-1397639999
  autocmd BufEnter * normal zx
augroup END

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

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
"
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

augroup Quickfix
  autocmd!

  autocmd FileType qf map <buffer> dd :call RemoveQuickfixItem()<cr>j
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow
augroup END

" let g:c_syntax_for_h = 1
" augroup filetypedetect
"   autocmd!
"   autocmd BufRead,BufNewFile *.h setlocal filetype=c
" augroup END

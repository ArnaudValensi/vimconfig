call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-dispatch'
" Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'tpope/vim-fugitive'
Plug 'metakirby5/codi.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/BufOnly.vim'
" Plug 'w0rp/ale'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'ziglang/zig.vim'
Plug 'sheerun/vim-polyglot'
Plug 'kevinhwang91/rnvimr'
Plug 'liuchengxu/vim-which-key'
Plug 'brooth/far.vim'
Plug 'alok/notational-fzf-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-peekaboo'

" Auto pair
" Alternatives:
"  - https://github.com/Raimondi/delimitMate
"  - https://github.com/jiangmiao/auto-pairs
" Plug 'cohama/lexima.vim'
" Plug 'raimondi/delimitmate'
Plug 'jiangmiao/auto-pairs'
" Plug 'lyuts/vim-rtags'

call plug#end()

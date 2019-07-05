call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-dispatch'
Plug 'OmniSharp/omnisharp-vim'
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
Plug 'w0rp/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

" Auto pair
" Alternatives:
"  - https://github.com/Raimondi/delimitMate
"  - https://github.com/jiangmiao/auto-pairs
Plug 'cohama/lexima.vim'

call plug#end()

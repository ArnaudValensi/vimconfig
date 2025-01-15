let g:is_pro_host = system('hostname') =~# 'DERPR-AVALEN02'

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-dispatch'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/BufOnly.vim'
Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'ziglang/zig.vim'
Plug 'sheerun/vim-polyglot'
Plug 'kevinhwang91/rnvimr'
Plug 'liuchengxu/vim-which-key'
Plug 'alok/notational-fzf-vim'
Plug 'tpope/vim-eunuch'
Plug 'rust-lang/rust.vim'
Plug 'icatalina/vim-case-change'
" Plug 'mattn/emmet-vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'KabbAmine/zeavim.vim'
Plug 'rizzatti/dash.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'pantharshit00/vim-prisma'
Plug 'junegunn/vim-easy-align'
" Used by harpoon and telescope.
Plug 'nvim-lua/plenary.nvim'
" Used by telescope.
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
" Used by telescope.
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" Harpoon
Plug 'nvim-lua/popup.nvim'
Plug 'ThePrimeagen/harpoon'

" Plug 'ggandor/leap.nvim'

" Nelua
Plug 'stefanos82/nelua.vim'

if !g:is_pro_host
  Plug 'github/copilot.vim'
endif

Plug 'neomake/neomake'

Plug 'rluba/jai.vim'

Plug 'wuelnerdotexe/vim-astro'

let g:yoinkIncludeDeleteOperations = 1
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'

call plug#end()

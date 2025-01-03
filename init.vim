source ~/.config/nvim/plugins.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/keys/mapping.vim
source ~/.config/nvim/keys/which-key.vim
source ~/.config/nvim/search.vim
source ~/.config/nvim/plug-config/rnvimr.vim
source ~/.config/nvim/plug-config/gitgutter.vim
" source ~/.config/nvim/plug-config/ycp-ultisnip.vim
" source ~/.config/nvim/plug-config/airline.vim
source ~/.config/nvim/plug-config/lightline.vim
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/notational-fzf.vim
" source ~/.config/nvim/plug-config/ale.vim
source ~/.config/nvim/plug-config/coc.vim
" source ~/.config/nvim/plug-config/omnisharp.vim
" source ~/.config/nvim/plug-config/c.vim
" source ~/.config/nvim/plug-config/emmet.vim
source ~/.config/nvim/plug-config/css.vim
source ~/.config/nvim/plug-config/rust.vim
source ~/.config/nvim/plug-config/zeal.vim
source ~/.config/nvim/plug-config/vim-bookmarks.vim
source ~/.config/nvim/plug-config/vim-easy-align.vim
source ~/.config/nvim/plug-config/neomake.vim
source ~/.config/nvim/plug-config/copilot.vim
source ~/.config/nvim/plug-config/vim-astro.vim
source ~/.config/nvim/nonos-toolkit-project.vim
source ~/.config/nvim/oob-project.vim

lua require('user.treesitter')
set termguicolors
lua require'colorizer'.setup()

lua require'user.telescope'
lua require'user.terminal'

" lua require('leap').add_default_mappings()


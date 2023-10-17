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

lua require('user.treesitter')
set termguicolors
lua require'colorizer'.setup()

" TODO: Move to a user.telescope file
" https://github.com/nvim-telescope/telescope-fzf-native.nvim
" https://github.com/nvim-telescope/telescope.nvim
lua << EOF
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = "close",
      },
    },
  },
  pickers = {
    live_grep = {
      push_cursor_on_edit = true,
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  }
}
EOF

lua require('telescope').load_extension('fzf')
" To do fuzzy search
" :Telescope grep_string search=

lua require('telescope').load_extension('vim_bookmarks')

" lua require('leap').add_default_mappings()



-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/nvim-telescope/telescope.nvim
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

require('telescope').load_extension('fzf')
-- To do fuzzy search
-- :Telescope grep_string search=

require('telescope').load_extension('vim_bookmarks')

local function find_config_files()
  require('telescope.builtin').find_files {
    cwd = vim.fn.stdpath("config")
  }
end

vim.keymap.set("n", "<space>f.", find_config_files)

vim.keymap.set("n", "<space>fp", require('telescope.builtin').help_tags)

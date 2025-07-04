
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
-- https://github.com/nvim-telescope/telescope.nvim
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "%.git/", "node_modules/", "%.cache/" },
    preview = {
      treesitter = true,
    },
    mappings = {
      i = {
        ["<esc>"] = "close",
      },
    },
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      height = 0.95,
      preview_width = 0.6,
    },
  },
  pickers = {
    live_grep = {
      push_cursor_on_edit = true,
      additional_args = function() return {"--hidden"} end,
    },
    buffers = {
      show_all_buffers = true,
      ignore_current_buffer = true,
      sort_mru = true,
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

local function find_in_config_files()
  require('telescope.builtin').live_grep {
    cwd = vim.fn.stdpath("config")
  }
end
vim.keymap.set("n", "<space>f>", find_in_config_files)

vim.keymap.set("n", "<space>fp", require('telescope.builtin').help_tags)

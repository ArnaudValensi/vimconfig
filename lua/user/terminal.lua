-- vim.api.nvim_create_autocmd('TermOpen', {
--     group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
--     callback = function()
--       vim.opt.number = false
--       vim.opt.relativenumber = false
--     end,
-- })

local job_id = 0
local terminal_buf = -1

vim.keymap.set("n", "<space>vv", function()
  local build_cmd = ""
  local sysname = vim.loop.os_uname().sysname
  if sysname == "Darwin" then
    build_cmd = "cd ~/dev/oob/repos/oob-jai && jai build.jai - build && ./build/game --no-music\r\n"
  else
    build_cmd = "cd /mnt/d/dev/oob/repos/oob-jai && jai.exe build.jai - build && ./build/game.exe\r\n"
  end

  if job_id == 0 or not vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.cmd("terminal")
    terminal_buf = vim.api.nvim_get_current_buf()
    job_id = vim.bo.channel
  else
    vim.api.nvim_set_current_buf(terminal_buf)
  end

  vim.cmd("wa")
  vim.fn.chansend(job_id, { build_cmd })

  -- Scroll to the bottom of the terminal
  vim.api.nvim_buf_call(terminal_buf, function()
    vim.cmd("normal! G")  -- Move to the end of the buffer
  end)

  -- Add key mapping to jump to file and line number
  vim.api.nvim_buf_set_keymap(
    terminal_buf,
    "n",
    "<CR>",
    "",
    {
      noremap = true,
      silent = true,
      callback = function()
        -- Get the current line
        local line = vim.api.nvim_get_current_line()
        -- Match relative file path, line, and column numbers
        local relative_file, line_number, column_number = string.match(line, "%./([%w%./_%-]+):(%d+),(%d+):")
        if relative_file and line_number and column_number then
          -- Debug: Print the extracted relative file, line, and column numbers
          -- print("Relative file: " .. relative_file)
          -- print("Line number: " .. line_number)
          -- print("Column number: " .. column_number)
          -- Open file, jump to the line, and move to the column
          vim.cmd("e " .. relative_file)
          vim.cmd(":" .. line_number)
          vim.cmd("normal! " .. column_number .. "|")  -- Move to the column
        else
          print("No valid file/line/column pattern found on the current line.")
        end
      end
    }
  )
end)

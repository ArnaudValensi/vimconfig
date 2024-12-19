vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
    end,
})

local job_id = 0
local terminal_buf = -1

vim.keymap.set("n", "<space>vv", function()
  local build_cmd = "cd /mnt/d/dev/oob/repos/oob-jai && jai.exe build.jai - build && ./build/game.exe --no-music\r\n"

  if job_id == 0 or not vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.cmd("terminal")
    terminal_buf = vim.api.nvim_get_current_buf()
    job_id = vim.bo.channel
  else
    vim.api.nvim_set_current_buf(terminal_buf)
  end

  vim.fn.chansend(job_id, { build_cmd })

  -- Scroll to the bottom of the terminal
  vim.api.nvim_buf_call(terminal_buf, function()
    vim.cmd("normal! G")  -- Move to the end of the buffer
  end)
end)

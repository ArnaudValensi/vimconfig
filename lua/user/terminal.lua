vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
    end,
})

vim.keymap.set("n", "<space>vv", function()
  local build_cmd = "cd /mnt/d/dev/oob/repos/oob-jai && jai.exe build.jai - build && ./build/game.exe --no-music\r\n"
  local terminal_name = "BuildTerminal"
  -- local terminal_buf = nil

  vim.cmd.term()

  local job_id = vim.bo.channel
  vim.fn.chansend(job_id, { build_cmd })
end)

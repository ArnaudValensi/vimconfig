local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "c", "c_sharp", "cpp", "css", "go", "json", "lua", "make", "markdown", "python", "rasi", "regex", "rust", "scss", "toml", "tsx", "vim", "yaml", "zig" },
  sync_install = true, -- install languages synchronously (only applied to `ensure_installed`)
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}

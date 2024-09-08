-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function load_project_config()
  local config_file = vim.fn.findfile(".nvim.lua", vim.fn.getcwd() .. ";")
  if config_file ~= "" then
    dofile(config_file)
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = load_project_config,
})

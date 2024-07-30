vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ld", vim.cmd.Lazy)
vim.keymap.set("n", "<leader>fs", vim.cmd.w)
vim.keymap.set("n", "<leader>qq", vim.cmd.q)

vim.keymap.set('n', '<leader>fd', function()
  local file = vim.fn.expand('%')
  vim.fn.delete(file)
  vim.cmd('bdelete!')
  print("Deleted " .. file)
end, { desc = "Delete current file and close buffer" })

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

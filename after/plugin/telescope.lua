local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })

vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })



vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.cmd("setlocal autowrite")
    vim.cmd("cd " .. vim.fn.expand("%:p:h"))
  end,
})


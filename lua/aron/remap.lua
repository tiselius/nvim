local wk = require("which-key")

-- General Keymaps
vim.g.mapleader = " "  -- Set space as leader key

vim.keymap.set("n", "<leader>pv", function()
  local path = vim.api.nvim_buf_get_name(0)
  require("mini.files").open(path ~= "" and path or nil, true)
end, { desc = "File explorer" })

vim.keymap.set("n", "<leader>pV", vim.cmd.Ex, { desc = "Vim RC" })

-- Move selected lines in visual mode (J: down, K: up)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Yank to system clipboard (y: normal mode, Y: whole line)
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to system" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to system" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank entire line to system" })

-- Clear search highlight
vim.keymap.set('n', '<leader>n', ':noh<CR>', { desc = 'Clear search highlight' })

-- Search and replace the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor" })

-- Escape from terminal mode to normal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Escape from terminal mode" })

-- Indentation in visual mode (Tab: indent, Shift+Tab: unindent)
vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true, silent = true, desc = "Indent selected lines" })
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true, silent = true, desc = "Unindent selected lines" })

-- LSP-related keymaps (now using <leader>la prefix to avoid conflicts)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format document" })
vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover information" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, { desc = "Previous problem" })
vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, { desc = "Next problem" })

-- Comments
-- Toggle comment line
vim.keymap.set('n', '<leader>7', function()
  return require('vim._comment').operator() .. '_'
end, { expr = true, desc = 'Toggle comment line' })

-- Visual mode comment (for selected block)
vim.keymap.set('v', '<leader>7', function()
  return require('vim._comment').operator()
end, { expr = true, desc = 'Toggle comment in visual mode' })
--
-- Operator-pending mode (for gc + movement)
vim.keymap.set({ 'n', 'x' }, '<leader>c', function()
  return require('vim._comment').operator()
end, { expr = true, desc = 'Toggle comment' })

-- Buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprev<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bd!", ":bx<CR>", { desc = "Delete buffer forcefully" })
vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>pp", "<cmd>Telescope projects<CR>" )





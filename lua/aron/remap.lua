local wk = require("which-key")

-- General Keymaps
vim.g.mapleader = " "  -- Set space as leader key

-- Open file explorer (Ex mode)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer (Ex mode)" })

-- Move selected lines in visual mode (J: down, K: up)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Yank to system clipboard (y: normal mode, Y: whole line)
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard (normal mode)" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard (visual mode)" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "Yank entire line to system clipboard" })

-- Clear search highlight
vim.keymap.set('n', '<leader>n', ':noh<CR>', { desc = 'Clear search highlight' })

-- Search and replace the word under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word under cursor" })

-- Escape from terminal mode to normal mode
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Escape from terminal mode" })

-- LaTeX-related commands (with VimTeX plugin)
vim.api.nvim_set_keymap('n', '<leader>lc', ':VimtexCompile<CR>', { noremap = true, silent = true, desc = "Compile LaTeX document" })  -- Compile LaTeX
vim.api.nvim_set_keymap('n', '<leader>lv', ':VimtexView<CR>', { noremap = true, silent = true, desc = "View LaTeX PDF" })     -- View LaTeX PDF
vim.api.nvim_set_keymap('n', '<leader>lk', ':VimtexClean<CR>', { noremap = true, silent = true, desc = "Clean LaTeX auxiliary files" }) -- Clean LaTeX

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

-- Diagnostics Navigation (remapped to <leader>dn and <leader>dp)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Next diagnostic" })



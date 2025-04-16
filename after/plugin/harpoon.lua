
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- Mark file add
vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to mark" })

-- Toggle the quick menu UI
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle quick menu" })

-- Navigation through files (using ui.nav_file for specific file numbers)
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Navigate to file 1" })
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = "Navigate to file 2" })
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "Navigate to file 3" })
vim.keymap.set("n", "<C-s>", function() ui.nav_file(5) end, { desc = "Navigate to file 5" })


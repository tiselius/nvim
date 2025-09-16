local wk = require("which-key")

wk.add({
  { "<leader>g", group = "Git", icon = { icon = "", color = "orange" } },
  { "<leader>p", group = "Find", icon = { icon = "", color = "purple" } },
  { "<leader>7", desc = "Comment line", icon = { icon = "󰅺", color = "purple" } },
  { "<leader>c", desc = "Comment + mov", icon = { icon = "󰅺", color = "red" } },
  { "<leader>pv", desc = "File explorer", icon = { icon = "", color = "purple" } },
  { "<leader>pV", desc = "Vim RC", icon = { icon = "", color = "azure" } },
  { "<leader>pp", desc = "Projects", icon = { icon = "", color = "purple" } },
})

wk.add({
  { "<leader>l", group = "LSP", icon = { icon = "", color = "red" } },
  { "<leader>la", group = "Code action", icon = { icon = "", color = "yellow" } },
  { "<leader>ld", group = "Go to definition", icon = { icon = "", color = "azure" } },
  { "<leader>lf", group = "Format document", icon = { icon = "󰉢", color = "azure" } },
  { "<leader>lh", group = "Hover information", icon = { icon = "", color = "red" } },
  { "<leader>lr", group = "Rename symbol", icon = { icon = "", color = "red" } },
  { "<leader>ls", group = "Signature help", icon = { icon = "", color = "blue" } },
  { "<leader>ln", group = "Next problem", icon = { icon = "", color = "red" } },
  { "<leader>lp", group = "Previous problem", icon = { icon = "", color = "red" } },
})

wk.add({
  { "\"%", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"#", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"=", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"a", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"b", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"g", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"i", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"j", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"k", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"o", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"q", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"t", desc = "idk", icon = { icon = "", color = "orange" } },
  { "\"w", desc = "idk", icon = { icon = "", color = "orange" } },
})

wk.add({
  { "<leader>b", group = "Buffers", icon = { icon = "", color = "blue" } },
  { "<leader>bn", group = "Next buffer", icon = { icon = "", color = "green" } },
  { "<leader>bp", group = "Previous buffer", icon = { icon = "", color = "green" } },
  { "<leader>bd", group = "Delete buffer", icon = { icon = "󰆴", color = "red" } },
  { "<leader>bx", group = "Delete buffer forcefully", icon = { icon = "󰆴", color = "red" } },
  { "<leader>bb", group = "pick Buffer", icon = { icon = "", color = "blue" } },
})


local wk = require("which-key")

wk.add({
    { "<leader>g", group = "Git", icon = {icon = "", color = "orange"} }, -- group
    { "<leader>p", group = "Find", icon = {icon = "", color = "purple"} }, -- group
})


wk.register({
  ["<leader>l"] = {
    name = "LSP", -- group name
    icon = {icon = "", color = "red"},
    a = { name = "Code action", icon = "" },
    d = { name = "Go to definition", icon = "" },
    f = { name = "Format document", icon = "󰉢" },
    h = { name = "Hover information", icon = "" },
    r = { name = "Rename symbol", icon = "" },
    s = { name = "Signature help", icon = "" },
  }
})

wk.register({
  ["<leader>d"] = {
    name = "Diagnostics", -- group name
    icon = {icon = "󱕼", color = "red"},
    n = { name = "Next diagnostic", icon = ""},
    p = { name = "Previous diagnostic", icon = ""},
  }
})

local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("func", fmt("function {}({}) {{
  {}
}}", {
    i(1, "name"),
    i(2, ""),
    i(3, "// code"),
  })),

  s("log", fmt("console.log({});", { i(1, ""Hello"") })),
}
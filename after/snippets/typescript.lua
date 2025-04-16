local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("typefunc", fmt("const {} = ({}: {}) => {{
  {}
}};", {
    i(1, "name"),
    i(2, "param"),
    i(3, "type"),
    i(4, "// code"),
  })),

  s("log", fmt("console.log({});", { i(1, ""Hello"") })),
}
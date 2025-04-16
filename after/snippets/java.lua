local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("main", fmt([[
public class {} {{
  public static void main(String[] args) {{
    {}
  }}
}}
]], {
    i(1, "Main"),
    i(2, "// code here"),
  })),

  s("sout", fmt("System.out.println({});", { i(1, ""Hello, World!"") })),
}
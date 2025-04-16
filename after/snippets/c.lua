local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("main", fmt([[
#include <stdio.h>

int main() {{
  {}
  return 0;
}}
]], {
    i(1, "// code here"),
  })),

  s("for", fmt("for (int {} = 0; {} < {}; {}++) {{
  {}
}}", {
    i(1, "i"),
    rep(1),
    i(2, "n"),
    rep(1),
    i(3),
  })),
}
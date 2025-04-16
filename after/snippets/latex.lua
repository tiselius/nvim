local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s("beg", fmt([[
\begin{{{}}}
  {}
\end{{{}}}
]], {
    i(1, "environment"),
    i(2),
    rep(1),
  })),

  s("sec", fmt("\section{{{}}}", { i(1, "Section Title") })),
  s("fig", fmt([[
\begin{{figure}}[h]
  \centering
  \includegraphics[width=\linewidth]{{{}}}
  \caption{{{}}}
  \label{{fig:{}}}
\end{{figure}}
]], {
    i(1, "image.png"),
    i(2, "Caption"),
    i(3, "label"),
  })),
}
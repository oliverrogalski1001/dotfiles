local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  s({trig = "mm", snippetType="autosnippet"},
    fmta(
      "$<>$",
      {i(1)}
    )
  ),
  -- s({trig = "([^%w])mm", regTrig = true, wordTrig = false, snippetType="autosnippet"}, {t("$$")}),
  s({trig = "ff", snippetType="autosnippet"},
    fmta(
      "\\frac{<>}{<>}",
      {i(1), i(2)}
    ),
    {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
  ),
  s({trig=";a", snippetType="autosnippet"},
    {t("\\alpha")}
  ),
  s({trig=";b", snippetType="autosnippet"},
    {t("\\beta")}
  ),
  s({trig=";g", snippetType="autosnippet"},
    {t("\\gamma")}
  ),
  s({trig=";d", snippetType="autosnippet"},
    {t("\\delta")}
  ),
  s({trig=";pi", snippetType="autosnippet"},
    {t("\\pi")}
  ),
  s({trig=";ph", snippetType="autosnippet"},
    {t("\\phi")}
  ),
  s({trig=";m", snippetType="autosnippet"},
    {t("\\mu")}
  ),
  s({trig="__", wordTrig=false, snippetType="autosnippet"},
    fmta(
      "_{<>}<>",
      {i(1), i(0)}
    )
  ),
  s({trig="++", wordTrig=false, snippetType="autosnippet"},
    fmta(
      "^{<>}<>",
      {i(1), i(0)}
    )
  ),
  s({trig="sq"},
    {t("^2")}
  ),
  s({trig="cb"},
    {t("^3")}
  ),
  s({trig="ss", snippetType="autosnippet"},
    fmta(
      "\\sum_{<>}^{<>}<>",
      {i(1), i(2), i(0)}
    )
  ),
  s({trig="tbf", snippetType="autosnippet"},
    fmta(
      "\\textbf{<>}<>",
      {i(1), i(0)}
    )
  ),
}

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
  s({trig="__", wordTrig=false, snippetType="autosnippet"},
    fmta(
      "_{<>}",
      {i(1)}
    ),
    {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
  ),
  s({trig="++", wordTrig=false, snippetType="autosnippet"},
    fmta(
      "^{<>}",
      {i(1)}
    ),
    {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
  ),
  s({trig="sq", snippetType="autosnippet"},
    {t("^2")},
    {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
  ),
  s({trig="cb", snippetType="autosnippet"},
    {t("^3")},
    {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
  ),
  s({trig="ss", snippetType="autosnippet"},
    fmta(
      "\\sum_{<>}^{<>}<>",
      {i(1), i(2), i(0)}
    )
  ),
  s({trig="tt", snippetType="autosnippet"},
    fmta(
      "\\text{<>}<>",
      {i(1), i(0)}
    ),
    {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
  ),
  s({trig="bm(%w)", regTrig=true, snippetType="autosnippet"},
    f(function(args, snip) return
      "\\bm{" .. snip.captures[1] .. "}" end, {}),
    {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
  ),
  s({trig="l2(%a)", regTrig=true, snippetType="autosnippet"},
    f(function(args, snip) return
      "\\norm{" .. "\\bm{" .. snip.captures[1] .. "}}_{2}^{2} " end, {}),
    {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
  ),
}

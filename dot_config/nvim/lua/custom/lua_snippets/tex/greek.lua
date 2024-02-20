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
  s({trig=";x", snippetType="autosnippet"},
    {t("\\xi")}
  ),
  s({trig=";m", snippetType="autosnippet"},
    {t("\\mu")}
  ),
  s({trig=";e", snippetType="autosnippet"},
    {t("\\varepsilon")}
  ),
  s({trig=";s", snippetType="autosnippet"},
    {t("\\sigma")}
  ),
}

return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  require("luasnip").snippet(
    {
      trig = "hi",
      dscr = "Hello world",
      regTrig=false,
    },
    { t("Hello, world!") }
  ),

  -- To return multiple snippets, use one `return` statement per snippet file
  -- and return a table of Lua snippets.
  require("luasnip").snippet(
    { trig = "foo" },
    { t("Another snippet.") }
  ),
}
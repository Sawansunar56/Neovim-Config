
local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local f = ls.function_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local t = ls.text_node

local types = require "luasnip.util.types"
local fmt = require("luasnip.extras.fmt").fmt

local snippets, autosnippets = {}, {}

ls.add_snippets("java", {
    s("input", fmt([[
        Scanner sc = new Scanner(System.in);
    ]], {}
    )),
})
return snippets, autosnippets


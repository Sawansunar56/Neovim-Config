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

ls.add_snippets("cpp", {
    s("mn", fmt([[
        #include <iostream>

        using namespace std;

        int main() {{
            {}
            return 0;
        }}
    ]], {i(0),}
    )),
})

ls.add_snippets("cpp", {
    s("cpmn", fmt([[
        #include <bits/stdc++.h>

        using namespace std;

        int main() {{
            ios::sync_with_stdio(false);
            cin(0);
            cout(0);
            {}
            return 0;
        }}
    ]], {i(0),}
    )),
})
ls.add_snippets("cpp", {
    s("ic", fmt([[
        #include <{}>
    ]], {
            i(0),
        }
    )),
})

return snippets, autosnippets


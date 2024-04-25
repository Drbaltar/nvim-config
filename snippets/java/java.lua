local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local var = s("v", fmt([[
var {} = {};
]], { i(1, "name"), i(0) })
)

local varNew = s("vn", fmt([[
var {} = new {}({});
]], { i(1, "name"), i(2, "Object"), i(0) })
)

local test = s("test", fmt([[
@Test
void should{}() throws Exception {{
    {}
}};
]], { i(1), i(0) })
)

local assertEquals = s("ae", fmt([[
assertEquals({}, {});
]], { i(1, "expected"), i(0, "actual") })
)

ls.add_snippets("java", { var, varNew, test, assertEquals })

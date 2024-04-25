local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

local getByRole = s("gr", fmt([[
screen.get{}ByRole("{}", {{ name: /{}/i}}){}
]], { c(1, {
    t(""),
    t("All")
}), i(2), i(3), i(0) })
)

local findByRole = s("fr", fmt([[
await screen.find{}ByRole("{}", {{ name: /{}/i}}){}
]], { c(1, {
    t(""),
    t("All")
}), i(2), i(3), i(0) })
)

local expectQueryByRole = s("qr", fmt([[
expect(screen.queryByRole("{}", {{ name: /{}/i}})).not.toBeInTheDocument(){}
]], { i(1), i(2), i(0) })
)

local getByText = s("gt", fmt([[
screen.get{}By{}(/{}/i){}
]], { c(1, {
    t(""),
    t("All")
}), c(2, {
    t("LabelText"),
    t("PlaceholderText"),
    t("Text"),
    t("DisplayValue"),
    t("AltText"),
    t("Title"),
    t("TestId"),
}), i(3), i(0) })
)

local findByText = s("ft", fmt([[
await screen.find{}By{}(/{}/i){}
]], { c(1, {
    t(""),
    t("All")
}), c(2, {
    t("LabelText"),
    t("PlaceholderText"),
    t("Text"),
    t("DisplayValue"),
    t("AltText"),
    t("Title"),
    t("TestId"),
}), i(3), i(0) })
)

local queryByText = s("qt", fmt([[
expect(screen.query{}By{}(/{}/i)).not.toBeInTheDocument(){}
]], { c(1, {
    t(""),
    t("All")
}), c(2, {
    t("LabelText"),
    t("PlaceholderText"),
    t("Text"),
    t("DisplayValue"),
    t("AltText"),
    t("Title"),
    t("TestId"),
}), i(3), i(0) })
)

ls.add_snippets("typescriptreact", { getByRole, findByRole, expectQueryByRole, getByText, findByText, queryByText })

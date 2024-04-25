local ls = require("luasnip")
local sc = require("luasnip.extras.select_choice")
dofile(vim.fn.expand("~/.config/nvim/snippets/javascript/react-testing-library.lua"))
dofile(vim.fn.expand("~/.config/nvim/snippets/java/java.lua"))

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })

vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-j>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-k>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-k>", "<Plug>luasnip-prev-choice", {})
vim.keymap.set("i", "<C-s>", sc)
vim.keymap.set("s", "<C-s>", sc)

local open_with_trouble = require("trouble.sources.telescope").open

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = open_with_trouble },
      n = { ["<c-t>"] = open_with_trouble },
    },
  },
}

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

vim.keymap.set("n", "<C-j>", function() require("trouble").next({ skip_groups = true, jump = true }) end)
vim.keymap.set("n", "<C-k>", function() require("trouble").prev({ skip_groups = true, jump = true }) end)

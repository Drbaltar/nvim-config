-- local neotest = require("neotest")
--
-- vim.keymap.set("n", "<leader>tf", function()
--     vim.api.nvim_command('write')
--     neotest.run.run(vim.fn.expand("%"))
-- end)
-- vim.keymap.set("n", "<leader>tc", function()
--     vim.api.nvim_command('write')
--     neotest.run.run()
-- end)
-- vim.keymap.set("n", "<leader>ts", function()
--     vim.api.nvim_command('write')
--     neotest.run.stop()
-- end)
-- vim.keymap.set("n", "<leader>tt", function()
--     vim.api.nvim_command('write')
--     neotest.run.run_last()
-- end)


vim.keymap.set("n", "<leader>ts", function()
    vim.api.nvim_command('wa')
    vim.api.nvim_command('TestSuite')
end)
vim.keymap.set("n", "<leader>tf", function()
    vim.api.nvim_command('wa')
    vim.api.nvim_command('TestFile')
end)
vim.keymap.set("n", "<leader>tn", function()
    vim.api.nvim_command('wa')
    vim.api.nvim_command('TestNearest')
end)
vim.keymap.set("n", "<leader>tt", function()
    vim.api.nvim_command('wa')
    vim.api.nvim_command('TestLast')
end)

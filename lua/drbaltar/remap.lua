vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc="[P]roject [V]iew of all files"})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc="[C]ode [A]ctions"})

-- Moves line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc="Move current line down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc="Move current line up"})

-- Replaces selected text without replacing the default buffer 
vim.keymap.set("x", "<leader>p", "\"_dP", {desc="Paste text without replacing buffer"})

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

vim.keymap.set("n", "<leader>b", ':cclose<CR>')
vim.keymap.set("t", "<Esc>", '<C-\\><C-n>')

-- Opens small terminal at the bottom and focuses
vim.keymap.set("n", "<leader>obt", '<C-w>s<C-w><C-w>:term<CR>10<C-w>_i', {desc="[O]pen [B]ottom [T]erminal"})

vim.keymap.set("n", "<leader>oi", function() 
  vim.lsp.buf.execute_command({
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  })
end)

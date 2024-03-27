vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew of all files" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move current line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move current line up" })

vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste text without replacing buffer" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]efactor: Re[N]ame" })

vim.keymap.set("n", "<leader>b", ':cclose<CR>', { desc = "Close quickfix window" })
vim.keymap.set("t", "<Esc>", '<C-\\><C-n>', { desc = "Shorcut to exit terminal mode" })

-- Opens small terminal at the bottom and focuses
vim.keymap.set("n", "<leader>obt", '<C-w>s<C-w><C-w>:term<CR>10<C-w>_i', { desc = "[O]pen [B]ottom [T]erminal" })

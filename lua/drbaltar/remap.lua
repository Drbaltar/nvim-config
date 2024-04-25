vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "[P]roject [V]iew of all files" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move current line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move current line up" })

vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Paste text without replacing buffer" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]efactor: Re[N]ame" })

vim.keymap.set("t", "<Esc>", '<C-\\><C-n>', { desc = "Shorcut to exit terminal mode" })

-- Opens small terminal at the bottom and focuses
vim.keymap.set("n", "<leader>obt", '<C-w>s<C-w><C-w>:term<CR>10<C-w>_i', { desc = "[O]pen [B]ottom [T]erminal" })
vim.keymap.set("n", "<leader>ost", '<C-w>v<C-w><C-w>:vertical resize -40<CR>:term<CR>i', { desc = "[O]pen [S]ide [T]erminal" })

vim.keymap.set("n", "<leader>cc", ':cclose<CR>', { desc = "Close quickfix window" })
vim.keymap.set("n", "<leader>co", ':copen<CR>', { desc = "Open quickfix window" })
vim.keymap.set("n", "<leader>j", ':cnext<CR>', { desc = "Go to next entry in quickfix window" })
vim.keymap.set("n", "<leader>k", ':cprev<CR>', { desc = "Go to previous entry in quickfix window" })

vim.keymap.set("n", "<leader>cb", ':bp | sp | bn | bd<CR>', { desc = "[C]lose [B]uffer" })


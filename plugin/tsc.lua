require('tsc').setup({
    bin_path = vim.fn.findfile("node_modules/.bin/tsc"),
    use_trouble_qflist = true,
    auto_close_qflist = true
})

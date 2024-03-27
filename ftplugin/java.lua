local jdtls = require('jdtls')

local function on_attach()
    vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, { desc = "[O]rganize [I]mports" })
    vim.keymap.set("n", "<leader>rv", jdtls.extract_variable, { desc = "[R]efactor: Extract [V]ariable" })
    vim.keymap.set("n", "<leader>ra", jdtls.extract_variable_all,
        { desc = "[R]efactor: Extract Variable and Replace [All]" })
    vim.keymap.set("n", "<leader>rc", jdtls.extract_constant, { desc = "[R]efactor: Extract [C]onstant" })
    vim.keymap.set("x", "<leader>rm", jdtls.extract_method, { desc = "[R]efactor: Extract [M]ethod" })
end

local config = {
    cmd = {
        vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls"),
        "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand "$MASON/share/jdtls/lombok.jar")
    },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    on_attach = on_attach
}

require('jdtls').start_or_attach(config)

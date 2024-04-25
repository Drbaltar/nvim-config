local jdtls = require('jdtls')
local jdtlsTests = require('jdtls.tests')

local function on_attach()
    vim.keymap.set("n", "<leader>oi", jdtls.organize_imports, { desc = "[O]rganize [I]mports" })
    vim.keymap.set("n", "<leader>rv", jdtls.extract_variable, { desc = "[R]efactor: Extract [V]ariable" })
    vim.keymap.set("n", "<leader>ra", jdtls.extract_variable_all,
        { desc = "[R]efactor: Extract Variable and Replace [All]" })
    vim.keymap.set("n", "<leader>rc", jdtls.extract_constant, { desc = "[R]efactor: Extract [C]onstant" })
    vim.keymap.set("x", "<leader>rm", jdtls.extract_method, { desc = "[R]efactor: Extract [M]ethod" })
    vim.keymap.set("n", "<leader>tj", jdtls.test_class, { desc = "[T]est [J]ava Class" })
    vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, { desc = "[T]est [M]ethod in Test Class" })
    vim.keymap.set("n", "<leader>gt", jdtlsTests.goto_subjects, { desc = "[G]o to [T]est/Subject" })
end

local bundles = {
    vim.fn.glob("~/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar", 1),
};

vim.list_extend(bundles, vim.split(vim.fn.glob("~/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
    cmd = {
        vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls"),
        "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand "$MASON/share/jdtls/lombok.jar")
    },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    init_options = {
        bundles = bundles,
    },
    on_attach = on_attach
}

require('jdtls').start_or_attach(config)


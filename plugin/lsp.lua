local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format({ details = true })

require('luasnip.loaders.from_vscode').lazy_load()

lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'ts_ls', 'jdtls', 'gopls', 'lua_ls' },
    handlers = {
        lsp_zero.default_setup,
        ['jdtls'] = function()
        end
    }
})

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end
    },
    --- (Optional) Show source name in completion menu
    formatting = cmp_format,
})

vim.api.nvim_create_autocmd("FileType",
    {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
            require('cmp').setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
        end
    })


local function ts_on_attach()
    vim.keymap.set("n", "<leader>oi", function()
        vim.lsp.buf.execute_command({
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
        })
    end)
end

require("neodev").setup()

require("lspconfig").ts_ls.setup {
    settings = {
        implicitProjectConfiguration = {
            checkJs = true
        },
    },
    on_attach = ts_on_attach
}

require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
            completion = {
                callSnippet = "Replace"
            }
        }
    }
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>]d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })

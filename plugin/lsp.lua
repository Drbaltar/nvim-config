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
    ensure_installed = { 'tsserver' },
    handlers = {
        lsp_zero.default_setup,
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

require("lspconfig").tsserver.setup {
    settings = {
        implicitProjectConfiguration = {
            checkJs = true
        },
    }
}

require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

require("lspconfig").jdtls.setup {
    cmd = {
        'jdtls',
        "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand "$MASON/share/jdtls/lombok.jar"),
    }
}

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>]d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })

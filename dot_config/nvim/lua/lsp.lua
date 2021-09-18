vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = true,
    }
)
local signs = { Error = '', Warn = '', Hint = '', Info = '' }
for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'help',
        'javascript',
        'lua',
        'python',
        'rust',
        'typescript',
        'toml',
        'vim',
    },
    highlight = { enable = true },
    indent = { enable = false }, -- this seems to break indentation, check for updates
}

require'nvim_comment'.setup {
    comment_empty = false,
    create_mappings = false,
}

require'lsp-format'.setup {}

require'mason'.setup {
    ui = {
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗'
        }
    }
}
require'mason-lspconfig'.setup {
    ensure_installed = {
        'bashls',
        'denols',
        'dockerls',
        'jsonls',
        'lua_ls',
        'pyright',
        'r_language_server',
        'rust_analyzer',
        'taplo',
        'tflint',
        'tsserver',
        'yamlls',
    },
}

local lspconfig = require'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require'cmp_nvim_lsp'.default_capabilities(capabilities)

lspconfig.bashls.setup { capabilities = capabilities, }
lspconfig.denols.setup {
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("deno.json"),
    init_options = {
        lint = true,
    },
}
lspconfig.dockerls.setup { capabilities = capabilities, }
lspconfig.jsonls.setup { capabilities = capabilities, }
lspconfig.lua_ls.setup { capabilities = capabilities, }
lspconfig.pyright.setup { capabilities = capabilities, }
lspconfig.r_language_server.setup { capabilities = capabilities, }
lspconfig.taplo.setup { capabilities = capabilities, }
lspconfig.tflint.setup { capabilities = capabilities, }
lspconfig.tsserver.setup {
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("package.json"),
    init_options = {
        lint = true,
    },
}
lspconfig.yamlls.setup { capabilities = capabilities, }

require'rust-tools'.setup {
    tools = {
        inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            parameter_hints_prefix = '◂ ',
            other_hints_prefix = '▸ ',
        }
    },
    server = {
        on_attach = require'lsp-format'.on_attach,
        -- capabilities = capabilities,
        settings = {
            ['rust-analyzer'] = {
                cargo = { allFeatures = true },
                checkOnSave = {
                    command = "clippy"
                }
            }
        }
    },
}
require'crates'.setup {}

local null = require'null-ls'
null.setup {
    sources = {
        null.register(null.builtins.formatting.isort),
        null.register(null.builtins.formatting.black),
        null.register(null.builtins.formatting.stylua),
        null.register(null.builtins.formatting.taplo),
    }
}

require'nlspsettings'.setup {
    append_default_schemas = true
}

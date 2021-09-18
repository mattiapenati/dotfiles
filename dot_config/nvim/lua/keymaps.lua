vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local wk = require'which-key'
wk.setup {}
wk.register({
    ['<leader>'] = {
        ['/'] = { '<cmd>set operatorfunc=CommentOperator<CR>g@l', 'Comment' },
        ['e'] = { '<cmd>NvimTreeToggle<CR>', 'Explorer' },
        ['h'] = { '<cmd>nohlsearch<CR>', 'No highlight' },
        ['q'] = { '<cmd>q!<CR>', 'Quit' },
        ['w'] = { '<cmd>w!<CR>', 'Save' },
        f = {
            name = 'File',
            b = { '<cmd>lua require("telescope.builtin").buffers()<CR>', 'Buffers' },
            f = { '<cmd>lua require("telescope.builtin").find_files()<CR>', 'Files' },
            g = { '<cmd>lua require("telescope.builtin").live_grep()<CR>', 'Live Grep' },
            o = { '<cmd>lua require("telescope.builtin").oldfiles()<CR>', 'Prev Open Files' },
            w = { '<cmd>lua require("telescope.builtin").file_browser()<CR>', 'File Browser' },
        },
        g = {
            name = 'Go to',
            d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
            g = { '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find<CR>', 'Text' },
        },
        G = {
            name = 'Git',
            b = { '<cmd>Gitsigns blame_line<CR>', 'Blame' },
            n = { '<cmd>Gitsigns next_hunk<CR>', 'Next hunk' },
            p = { '<cmd>Gitsigns prev_hunk<CR>', 'Prev hunk' },
            v = { '<cmd>Gitsigns preview_hunk<CR>', 'Show hunk' },
            s = {
                name = 'Search',
                b = { '<cmd>lua require("telescope.builtin").git_branches()<CR>', 'Branches' },
                c = { '<cmd>lua require("telescope.builtin").git_commits()<CR>', 'Commit Log' },
            }
        },
        L = {
            name = 'LSP',
            a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code action' },
            d = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Show diagnostic' },
            f = { '<cmd>lua vim.lsp.buf.format { async = true }<CR>', 'Format' },
            h = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature help' },
            n = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Next diagnostic' },
            p = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Prev diagnostic' },
            s = {
                name = 'Search',
                a = { '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', 'Code Actions' },
                d = { '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', 'Definitions' },
                e = { '<cmd>lua require("telescope.builtin").treesitter()<CR>', 'Treesitter' },
                g = { '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>', 'Document Diagnostics' },
                i = { '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', 'Implementations' },
                n = { '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<CR>', 'Range Code Actions' },
                o = { '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>', 'Workspace Diagnostics' },
                r = { '<cmd>lua require("telescope.builtin").lsp_references()<CR>', 'References' },
                s = { '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', 'Document Symbols' },
                t = { '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', 'Type Definitions' },
                v = { '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', 'Dynamic Workspace Symbols' },
                w = { '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', 'Workspace Symbols' },
            },
            r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
            I = { '<cmd>Mason<CR>', 'Install' },
            S = { '<cmd>LspInfo<CR>', 'Status' },
        },
        P = {
            name = 'Packer',
            c = { '<cmd>PackerCompile<CR>', 'Compile' },
            i = { '<cmd>PackerInstall<CR>', 'Install' },
            s = { '<cmd>PackerSync<CR>', 'Sync' },
            u = { '<cmd>PackerUpdate<CR>', 'Update' },
            C = { '<cmd>PackerClean<CR>', 'Clean' },
            S = { '<cmd>PackerStatus<CR>', 'Status' },
        },
        T = {
            name = 'TreeSitter',
            u = { '<cmd>TSUpdate<CR>', 'Update' },
            I = { '<cmd>TSIntallInfo<CR>', 'Install status' },
            S = { '<cmd>TSConfigInfo<CR>', 'Status' },
        },
        V = {
            name = 'ViM',
            c = { '<cmd>edit'..vim.fn.stdpath('config')..'/init.lua<CR>', 'Edit init.lua' },
            o= { '<cmd>lua require("telescope.builtin").vim_options()<CR>', 'Options' },
            h = { '<cmd>lua require("telescope.builtin").help_tags()<CR>', 'Help tags' },
        }
    },
    g = {
        d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'Go to definition' },
    },
})

wk.register({
    ['<leader>'] = {
        ['/'] = { ':<c-u>call CommentOperator(visualmode())<CR>', 'Comment' },
    }
}, { mode = 'v' })


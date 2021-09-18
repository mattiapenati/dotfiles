vim.o.breakindent = true               -- wrapped line will continue visually indented
vim.o.completeopt = 'menuone,noselect' -- completetion menu
vim.o.colorcolumn = '80,120'           -- highlighted screen columns
vim.o.cursorline = true                -- highlight cursor line
vim.o.encoding = 'utf-8'               -- string encoding using to display
vim.o.expandtab = true                 -- replace tab with spaces
vim.o.hidden = true                    -- keep unsaved buffers opened
vim.o.list = true                      -- show whitespaces
vim.o.listchars = 'tab:▸ '             -- strings to use in list mode
vim.o.mouse = ''                       -- disable mouse
vim.o.number = true                    -- show the line number in front of each line
vim.o.relativenumber = true            -- show the line number relative to the cursor
vim.o.scrolloff=10                     -- number of screen lines to keep around the cursor
vim.o.shiftwidth = 4                   -- number of spaces for each step
vim.o.signcolumn = 'yes'               -- always draw signcolumn
vim.o.tabstop = 4                      -- number of spaces that a Tab counts for
vim.o.timeoutlen = 250                 -- time in ms to wait for a mapped sequence
vim.o.undofile = true                  -- saves undo history to an undo file

-- folding
vim.api.nvim_exec([[
    set foldexpr=nvim_treesitter#foldexpr()
    set foldmethod=expr
    set foldlevel=9999
]], true)


-- telescope
local telescope = require'telescope'
telescope.setup {
    defaults = {
        layout_strategy = 'vertical',
        layout_config = {
            vertical = { width = 0.9 }
        },
    },
    extensions = {
        ['ui-select'] = {
            require("telescope.themes").get_dropdown {}
        }
    }
}
telescope.load_extension('lsp_handlers')
telescope.load_extension('dap')
telescope.load_extension('ui-select')

-- nvim tree
require'nvim-tree'.setup {
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        custom = { '.git' }
    },
    view = {
        width = 50,
    },
}

-- git
require'gitsigns'.setup {}

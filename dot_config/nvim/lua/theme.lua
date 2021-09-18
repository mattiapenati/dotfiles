vim.o.background = 'light'  -- adjust the color groups
vim.o.termguicolors = true -- enable 24-bit colors

vim.g.catppuccin_flavour = 'macchiato'
require'catppuccin'.setup {}
vim.cmd [[colorscheme catppuccin]]
require'lualine'.setup { options = {
    theme = 'catppuccin',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
} }

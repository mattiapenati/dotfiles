vim.api.nvim_command([[autocmd BufWritePre *.rs lua vim.lsp.buf.format{ async=false }]])
vim.api.nvim_command([[autocmd FileType json,html,xml,yaml set tabstop=2 shiftwidth=2]])
vim.api.nvim_command([[autocmd FileType typescript set tabstop=4 shiftwidth=4]])

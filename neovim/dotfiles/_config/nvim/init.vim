call plug#begin(stdpath('data').'/plugged')
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" syntax highlight
Plug 'kevinoid/vim-jsonc'
Plug 'cespare/vim-toml'

call plug#end()

""" encoding
set encoding=utf-8

""" buffer
set hidden

""" appearence
set background=dark
set colorcolumn=80
set number relativenumber
if has("termguicolors")
    set termguicolors
endif
colorscheme onehalfdark
let g:lightline = { 'colorscheme': 'onehalfdark' }

""" whitespaces
set expandtab
set list
set listchars=tab:▸\ ,trail:◂
set shiftwidth=4
set tabstop=4
highlight TrailingWhitespace ctermfg=red guifg=red
match TrailingWhitespace /\s\+$/

""" fzf
command! -nargs=0 SearchCurrentDir CocCommand fzf-preview.DirectoryFiles
command! -nargs=0 FindCurrentFile CocCommand fzf-preview.Lines
command! -nargs=1 GrepCurrentDir CocCommand fzf-preview.ProjectGrep <args>
map <c-p> :SearchCurrentDir<CR>
map <c-f> :FindCurrentFile<CR>
map <c-g> :GrepCurrentDir<SPACE>
let g:fzf_preview_directory_files_command = 'fd --type f'
let g:fzf_preview_use_dev_icons = 1

""" Use <c-p> to trigger completion
inoremap <silent><expr> <c-p> coc#refresh()

""" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)


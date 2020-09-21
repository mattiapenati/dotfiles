call plug#begin(stdpath('data').'/plugged')
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" syntax highlight
Plug 'kevinoid/vim-jsonc'
Plug 'cespare/vim-toml'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

""" git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'

""" licenses
Plug 'antoyo/vim-licenses'

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
let g:lightline = {
    \ 'colorscheme': 'onehalfdark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status'
    \ },
\ }
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

""" whitespaces
set scrolloff=10
set expandtab
set list
set listchars=tab:▸\ ,trail:◂
set shiftwidth=4
set tabstop=4
highlight TrailingWhitespace ctermfg=red guifg=red
match TrailingWhitespace /\s\+$/

""" folding
set foldmethod=syntax
set foldlevelstart=20

""" fzf
command! -nargs=0 SearchCurrentDir CocCommand fzf-preview.DirectoryFiles
command! -nargs=0 FindCurrentFile CocCommand fzf-preview.Lines
command! -nargs=1 GrepCurrentDir CocCommand fzf-preview.ProjectGrep <args>
map <C-p> :SearchCurrentDir<CR>
map <C-f> :FindCurrentFile<CR>
map <C-g> :GrepCurrentDir<SPACE>
let g:fzf_preview_directory_files_command = 'fd --type f'
let g:fzf_preview_use_dev_icons = 1

""" NERDTree
let NERDTreeChDirMode=2
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.dylib$', '\.dSYM$', '__pycache__']
nmap <silent> <leader>o :NERDTreeToggle<CR>

""" Use <c-p> to trigger completion
inoremap <silent><expr> <C-p> coc#refresh()

""" use <leader-f> to format selected code
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
nmap <leader>p <Plug>(coc-format)

""" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

""" clangd
command! -nargs=0 SwitchSourceHeader CocCommand clangd.switchSourceHeader
autocmd FileType c nnoremap <buffer> <C-h> :SwitchSourceHeader<CR>
autocmd FileType cpp nnoremap <buffer> <C-h> :SwitchSourceHeader<CR>

""" rust
autocmd FileType rust compiler cargo

""" pandoc
let g:pandoc#folding#level = 9
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#spell#enabled = 0

""" licenses
let g:licenses_copyright_holders_name = 'Mattia Penati <mattia.penati@protonmail.com>'

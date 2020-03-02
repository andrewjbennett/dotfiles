set nocompatible


""""""""""""""""""""""""
" do some plugin stuff "
""""""""""""""""""""""""
filetype off

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'mbbill/undotree'

""" Trying to find a color scheme without much luck...
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'ayu-theme/ayu-vim' " or other package manager
" Plug 'agude/vim-eldar'
" Plug 'KabbAmine/yowish.vim'
" Plug 'phanviet/vim-monokai-pro'
" Plug 'kaicataldo/material.vim'
" Plug 'mhartington/oceanic-next'

""" Turned this off because it was annoying, and ALE works.
" Plug 'vim-syntastic/syntastic'
" let g:syntastic_rust_checkers = ['cargo', 'rustc']

""" This just made stuff crash
"Plug 'chrisbra/Colorizer'
"let g:colorizer_auto_filetype='html'

"Plug 'davidhalter/jedi-vim'

Plug 'w0rp/ale'
let g:ale_c_clang_options = '-std=gnu11 -Wall'
let g:ale_c_gcc_options = '-std=gnu11 -Wall'
let g:ale_linters = { 'python': [] }
let g:ale_rust_cargo_use_check = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
"Plug 'ryanolsonx/vim-lsp-python'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
let g:lsp_signs_enabled = 1           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

Plug 'wakatime/vim-wakatime'

Plug 'majutsushi/tagbar'

"Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
let g:mkdp_preview_options = {
    \ 'disable_sync_scroll': 1,
    \ }

Plug 'tpope/vim-fugitive'

Plug 'davidbeckingsale/writegood.vim'

""" Snippets stuff, never got it working though
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


call plug#end()

"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"colorscheme OceanicNext



filetype indent plugin on

""""""""""""""""""""""
" package stuff done
""""""""""""""""""""""

if executable('rustup')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly-2018-09-05', 'rls']},
        \ 'whitelist': ['rust'],
        \ 'workspace_config': {'sysroot': '/home/andrew/.xargo'}
        \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif


if executable('xclangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif


"\ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"let g:lsp_log_verbose = 1
"let g:lsp_log_file = expand('~/vim-lsp.log')

" for asyncomplete.vim log
"let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" if executable('rls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'rls',
"         \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
"         \ 'whitelist': ['rust'],
"         \ 'workspace_config': {'sysroot': '/home/andrew/.xargo'}
"         \ })
" endif

syntax on
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

set list listchars=tab:»·,trail:·,nbsp:·

set textwidth=72
set colorcolumn=+1
autocmd FileType html setlocal textwidth=0
autocmd FileType svg setlocal textwidth=0

autocmd BufRead,BufNewFile *.md *.toml *.html setlocal spell
set complete+=kspell

""" So that it doesn't shift the text around when there's a problem
set signcolumn=yes


""" Can't even remember what this was for :/
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"


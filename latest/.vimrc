set nocompatible


""""""""""""""""""""""
" do some vundle stuff
""""""""""""""""""""""
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Valloric/YouCompleteMe'

Plugin 'davidbeckingsale/writegood.vim'

call vundle#end()


execute pathogen#infect()

filetype indent plugin on
""""""""""""""""""""""
" vundle stuff done
""""""""""""""""""""""

syntax on
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab

set list listchars=tab:»·,trail:·,nbsp:·

set textwidth=72
set colorcolumn=+1

autocmd BufRead,BufNewFile *.md *.toml *.html setlocal spell
set complete+=kspell


" Vundle requirements
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Adds a lightweight status bar.
Plugin 'vim-airline/vim-airline'

" Asynchronous error checking
Plugin 'dense-analysis/ale'

call vundle#end() 
" filetype plugin indent on
filetype plugin on

let ale_enabled=0

" Personal settings
syntax on
set number
" On pressing tab, insert spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set ruler
" set backspace=indent,eol,start

" Stop auto comment symbols being added
set formatoptions-=ro
" Force it to occur if changed in pipeline...
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" Allows backspacing in insert mode.
set backspace=indent,eol,start

" Remove trailing whitespaces on save for specifc files
autocmd BufWritePre *.c,*.cc,*.cpp,*.java,*.php,*.py,*.html,*.css,*.pl,*.js,*.txt,*.r,*.cs,*.sh,*.m,*.yaml,*.json,*.md, mark w | %s/\s\+$//e | 'w

" Changes for ignoring case and smart case during searches
" set ignorecase
" set smartcase
" set hlsearch
" set incsearch

" Highlights matching brackets when selected
" set showmatch

" Set default encoding
" set encoding=utf8

" Setting vim buffer size to 2000 lines max.
set viminfo='20,<2000

" Highlight column 80 and 200
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,200"
" If wanting to highlight column 80, 120+
"let &colorcolumn="80,".join(range(120,999),",")

"Octave Syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

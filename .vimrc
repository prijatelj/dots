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

" fxf: easy searching and opening of files and buffers
" Plugin 'junegunn/fzf' " unnecessary on Arch Linx
Plugin 'junegunn/fzf.vim'

" Editing LaTeX files
Plugin 'lervag/vimtex'

" Indicate indent level
"Plugin 'yggdroot/indentline'
Plugin 'nathanaelkane/vim-indent-guides'

" Ease of alignment of text w/ delimiters, e.g. tables
Plugin 'junegunn/vim-easy-align'

" Org mode: For ease of writing meeting minutes, and organization
Plugin 'jceb/vim-orgmode'

call vundle#end() 
" filetype plugin indent on
filetype plugin on

" ALE settings
let g:ale_enabled = 0
let g:ale_linters = {
\   'python': ['pylint'],
\}
let g:ale_fixers = {
\   'python': ['yapf'],
\}
" \   'python': ['yapf', 'isort'],

" Vimtex settings
let g:tex_flavor = 'latex'

" Vim-indent-guides settings
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" Personal settings
syntax on
set number
" On pressing tab, insert spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent
set ruler
set backspace=indent,eol,start

" Stop auto comment symbols being added
set formatoptions-=ro
" Force it to occur if changed in pipeline...
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro

" Allows backspacing in insert mode.
set backspace=indent,eol,start

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

" Remove trailing whitespaces on save for specifc files
autocmd BufWritePre *.c,*.cc,*.cpp,*.java,*.php,*.py,*.html,*.css,*.pl,*.js,
\*.txt,*.r,*.cs,*.sh,*.m,*.yaml,*.json,*.md, mark w | %s/\s\+$//e | 'w

"Octave Syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

" Set the base colorscheme based on being local or remote.
if ( $SSH_CLIENT != "" && $SSH_TTY != "" )
    colorscheme slate
else
    "colorscheme zellner
    colorscheme lunaperche

    "Set highlight for matching parentheses
    hi MatchParen cterm=none ctermbg=darkblue ctermfg=none
endif
set background=dark
" All edits to color scheme must be after base is loaded.

" Highlight column 80 and 200
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,200"
" If wanting to highlight column 80, 120+
"let &colorcolumn="80,".join(range(120,999),",")

" Underlines the current line for cursor position.
highlight clear CursorLine
highlight CursorLine gui=underline cterm=underline 
"ctermfg=None guifg=None
set cursorline

syntax on
set number
set autoindent
" On pressing tab, insert spaces
set tabstop=4 softtabstop=0 expandtab shiftwidth=4
set ruler
set backspace=indent,eol,start

"Remove trailing whitespace on save for specific files
autocmd BufWritePre *.c,*.cpp,*.java,*.php,*.py,*.html,*.css,*.pl,*.js,*.txt,*.r,*.yaml,*.json,*.md mark w| %s/\s\+$//e | 'w

colorscheme zellner

highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,200"
"let &colorcolumn="80,".join(range(120,999),",")

"Octave Syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END

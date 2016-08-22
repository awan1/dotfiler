map  <c-w>
set t_Co=256
syntax enable

set tabstop=8 softtabstop=4 expandtab shiftwidth=4 smarttab
set autoindent

set laststatus=2
"set statusline=%t        "tail of the filename
set statusline=%F        "file full path
"set statusline=%f        "file relative path
"set statusline+=[
"set statusline+=%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff} "file format
"set statusline+=]
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
"set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

set mouse=a
"set clipboard=unnamed

set backspace=indent,eol,start
set tabpagemax=100

command Rmfile :call delete(@%) | q

"Automatically remove whitespace from all files on save
"http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e


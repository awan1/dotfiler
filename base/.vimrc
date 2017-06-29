" Adrian Wan
let mapleader=","  " set mapleader

" Sources {{{
" * https://dougblack.io/words/a-good-vimrc.html
" }}}
"
" Spacing {{{
set expandtab       " turn tabs into spaces
set tabstop=2       " number of visual spaces per tab
set softtabstop=2   " number of spaces in tab while editing
set shiftwidth=2    " number of spaces to shift by when tabbing?
set autoindent      " align new lines
" }}}

" UI {{{
set number          " show line numbers
" set showcmd         " show last command
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when need to
set showmatch       " highlight matching [({})]
" }}}

" Folds {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested folds, max
" use space to open folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
" }}}

" Search {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight using leader-c
nnoremap <leader>c :nohlsearch<CR>
" }}}

" Status line {{{
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
" }}}

" Enable plugins {{{
set nocp
execute pathogen#infect()
syntax on
filetype plugin indent on

" Set the tab width for all filetypes, to stop `filetype indent on` from
" overriding
let s:tabwidth=2
au Filetype * let &l:tabstop = s:tabwidth
au Filetype * let &l:shiftwidth = s:tabwidth
au Filetype * let &l:softtabstop = s:tabwidth
" }}}

" Shortcuts {{{
" Movement {{{
" Make Y like D: yank to end of line
nnoremap Y y$
" Move by visual line
" nnoremap j gj
" nnoremap k gk
"Remap ctrl-{h/j/k/l} to pane switch
map  <c-w>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}}
"
" Tools {{{
" toggle gundo - super-undo, graphical interface to tree
nnoremap <leader>u :GundoToggle<CR>
" open ag.vim - Silver Searcher
nnoremap <leader>a :Ag
" }}}
" Misc {{{
" Delete a given file
command Rmfile :call delete(@%) | q
" }}}
" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'  " Match top to bottom
let g:ctrlp_switch_buffer = 0                  " Always open files in new buffers
let g:ctrlp_working_path_mode = 0              " Make CtrlP respect working directory changes
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " Speedup with ag
" }}}

" Misc {{{
" Enable mouse navigation in vim
set mouse=a
"set clipboard=unnamed

set backspace=indent,eol,start
set tabpagemax=100

"Automatically remove whitespace from all files on save
"http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e

set t_Co=256  " 256 colors for solarized
syntax enable  " enable syntax processing
" }}}

""" Readability for this file
set modelines=1   " Apply the final line of this file as settings for this file only
" vim:foldmethod=marker:foldlevel=0

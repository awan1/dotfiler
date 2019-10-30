" Adrian Wan
let mapleader=","  " set mapleader

" Sources {{{
" * https://dougblack.io/words/a-good-vimrc.html
" }}}

" Vundle / Plugins {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'ervandew/supertab'  " To make YCM and UltiSnips work together
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Chiel92/vim-autoformat'
Plugin 'rhysd/vim-clang-format'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Enable Pathogen {{{
set nocp
execute pathogen#infect()
execute pathogen#helptags()
" }}}

" Do these early {{{
set t_Co=256  " for better color emulation
set background=dark " for color of comments
colorscheme zenburn
syntax on
syntax enable
"}}}

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

" Provide line length ruler and hard wrap
set colorcolumn=81
set tw=80

" Syntax highlighting in markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
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
" Prerequisite for these lines: `pip install powerline-status`
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

set laststatus=2  " Always display the statusline in all windows

" NOTE: these settings don't actually do anything! statusline is being set by
" powerline. Use `pip show powerline-status` to look for where the powerline
" files are. There might also be config stuff in ~/.config/powerline

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
set statusline+=%{ObsessionStatus()}
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
" Hide encoding in powerline
let g:airline_section_y=''
let g:webdevicons_enable_airline_statusline_fileformat_symbols=0
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

" Buffers {{{
" Close the current buffer without closing the view.
" Does this by switching to the previous buffer, and then closing the last-open
" one (which was the one open when this command was issued)
command! Cl :bp|bd#

" For reloading changes to buffers on disk, e.g. git branch switch
function! RefreshBuffers()
  set noconfirm
  set autoread
  checktime
  set noautoread
  set confirm
  echom "Buffers refreshed"
endfunction
nnoremap <leader>gr :call RefreshBuffers()<CR><CR>
"}}}

" Commenting {{{

" https://gist.github.com/dave-kennedy/2188b3dd839ac4f73fe298799bb15f3b
let s:comment_map = {
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "tex": '%',
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ '^\s*$'
            " Skip empty line
            return
        endif
        if getline('.') =~ '^\s*' . comment_leader
            " Uncomment the line
            execute 'silent s/\v\s*\zs' . comment_leader . '\s*\ze//'
        else
            " Comment the line
            execute 'silent s/\v^(\s*)/\1' . comment_leader . ' /'
        endif
    else
        echo "No comment leader found for filetype"
    endif
endfunction

" Ctrl-/
nnoremap  :call ToggleComment()<CR>
vnoremap  :call ToggleComment()<CR>
"}}}

" Tab-complete {{{
" Make tab-complete in visual-mode
:set wildmode=list:longest,full
" Could look at completeopt for insert-mode completion
" }}}

" Header/Source switching {{{
" From https://vim.fandom.com/wiki/Easily_switch_between_source_and_header_file
nnoremap <leader>s :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>
" }}}

" Misc {{{
" Delete a given file
command! Rmfile :call delete(@%) | q
" Source vim
command! Src :source $MYVIMRC

" }}}
" }}}

" Plugin config {{{
" YCM & UltiSnips {{{
" Close preview pane after leaving insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

" From https://stackoverflow.com/a/22253548/2452770

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

let g:UltiSnipsEditSplit="context"

" }}}

" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'  " Match top to bottom
let g:ctrlp_switch_buffer = 0                  " Always open files in new buffers
let g:ctrlp_working_path_mode = 0              " Make CtrlP respect working directory changes
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' " Speedup with ag
" }}}

" AutoFormat {{{
let g:formatters_python = ['yapf']
let g:formatter_yapf_style = 'google'
autocmd BufWrite *.py :Autoformat
" }}}

" ClangFormat {{{
let g:clang_format#code_style = "google"

" Run ClangFormat automatically for cpp files
autocmd FileType cpp ClangFormatAutoEnable
" }}}

" Other {{{
" toggle gundo - super-undo, graphical interface to tree
nnoremap <leader>u :GundoToggle<CR>
" open ag.vim - Silver Searcher
nnoremap <leader>a :Ag
" }}}
"}}}

" Formatting {{{
" Set the tab width for all filetypes, to stop `filetype indent on` from
" overriding
let s:tabwidth=2
au Filetype * let &l:tabstop = s:tabwidth
au Filetype * let &l:shiftwidth = s:tabwidth
au Filetype * let &l:softtabstop = s:tabwidth

" Automatically remove whitespace from all files on save
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType cpp ClangFormatAutoEnable
" }}}

" Misc {{{
" Enable mouse navigation in vim
set mouse=a
" Copy to system clipboard
set clipboard=unnamed

set backspace=indent,eol,start
set tabpagemax=100

" More natural split opening
set splitbelow
set splitright
" }}}

""" Readability for this file
set modelines=1   " Apply the final line of this file as settings for this file only
" vim:foldmethod=marker:foldlevel=0

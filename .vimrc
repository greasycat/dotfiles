" Search and Matching
set showmatch               " show matching
set ignorecase              " case insensitive
set hlsearch                " highlight search
set incsearch               " incremental search

" Tabbing
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed

" Line Number
set number

" Mouse
set mouse=a
" System Interaction
set cursorline
" Backups
set backupdir=~/.cache/vim

" Syntax
filetype indent plugin on
syntax on
set clipboard=unnamedplus

set encoding=UTF-8
" Keybinding
nnoremap ZA :wqa<CR>

" Change window
nnoremap <A-.> <C-W>l
nnoremap <A-,> <C-W>h

" Move window
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" Resize
nnoremap <A-=> <C-W>>
nnoremap <A--> <C-W><
nnoremap <A-0> <C-W>-
nnoremap <A-9> <C-W>+


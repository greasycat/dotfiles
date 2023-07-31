" Set paths
"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set pumheight=20
set completeopt=menu,menuone,noselect
set nopaste


" Load General Vimrc
source ~/.vimrc


if exists("g:neovide")
    execute "source" stdpath("config")."/ginit.vim"
endif

" Load Lua Configuations

lua require'init'

" Keymapping
execute "source" stdpath("config")."/mapping.vim"

" Rust
autocmd FileType rust set makeprg=cargo\ build\ 
autocmd BufEnter,BufNew Cargo.toml set makeprg=cargo\ build\ 


" Set paths
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set pumheight=20
set completeopt=menu,menuone,noselect
set nopaste


" Load General Vimrc
source ~/.vimrc
" Load Plugs
execute "source" stdpath("config")."/plugs.vim"


" Keymapping
execute "source" stdpath("config")."/mappings.vim"

" Coq autostart

" Load Lua Configuations

lua require'config'

if exists('g:GuiLoaded')
    execute "source" stdpath("config")."/ginit.vim"
endif

" Style/theme
colorscheme vscode

" Rust
autocmd FileType rust set makeprg=cargo\ build\ 
autocmd BufEnter,BufNew Cargo.toml set makeprg=cargo\ build\ 

function OpenTerminal()
    :split+term
    :wincmd J
    :resize 8 "set height
endfunction
noremap <F5> :call OpenTerminal()<CR>


let g:neoterm_default_mod='belowright' " open terminal in bottom split
let g:neoterm_size=16 " terminal split size
let g:neoterm_autoscroll=1 " scroll to the bottom when running a command

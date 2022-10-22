" Telescope Mapping
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <silent> <C-N> <cmd>QNext<CR>
nnoremap <silent> <C-P> <cmd>QPrev<CR>
" toggle the quickfix open/closed without jumping to it
nnoremap <silent> <leader>q <cmd>QFToggle!<CR>
nnoremap <silent> <leader>l <cmd>LLToggle!<CR>

" CHADTree
nnoremap <leader>f <cmd>CHADopen<cr>

nnoremap gd :lua vim.lsp.buf.definition()<cr>

"nmap <leader>t :split | terminal<CR>
"


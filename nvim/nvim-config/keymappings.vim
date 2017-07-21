" ----------[ Key Mappings ]----------

" Set the <leader> to , (comma)
let mapleader=","

" Edit / Reload the .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Show the buffers with F5 and prepare to switch/delete
nnoremap <F5> :buffers<CR>:b

" Bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Bind <leader>jt to json_pp, to format JSON
map <leader>jt  <Esc>:%!json_pp -f json -t json<CR>
" ------------------------------------


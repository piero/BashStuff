" ----------[ CTags ]----------
set tags=./tags,tags;$HOME

" Make Ctrl-] work with overloads
:function! TSFunc()
    execute "ts " . expand('<cword>')
:endfunction
map <C-]> :call TSFunc()<CR>
" -----------------------------


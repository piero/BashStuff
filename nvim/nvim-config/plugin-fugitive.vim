" ----------[ Fugitive ]----------
set statusline+=%{fugitive#statusline()}

" Define 'Gg' to make a new window for 'git grep' results
:command! -nargs=+ Gg execute 'silent Ggrep!' <q-args> | cw | redraw!
" --------------------------------


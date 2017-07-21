" ----------[ vim-mocha ]----------
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"let g:mocha_js_command = "!mocha --recursive --no-colors {spec}"
let g:mocha_js_command = "!mocha --recursive {spec}"
" ---------------------------------


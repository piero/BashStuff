" ----------[ Syntastic ]----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_cucumber_cucumber_args="--profile syntastic"

" Make sure to do: npm install -g eslint jscs, jshint
let g:syntastic_javascript_checkers = ['eslint', 'jscs', 'jshint']
let g:syntastic_aggregate_errors = 1

" Automatically select JavaScript linter for each buffer
autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs', 'jshint'] : ['eslint']
" ---------------------------------


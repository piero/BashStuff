" **********************
" * Base configuration *
" **********************

" Always use viMproved
set nocompatible
filetype off

" Use true colors in the terminal
set termguicolors

" ----------[ Vundle ]----------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'qpkorr/vim-bufkill'
Plugin 'vim-scripts/a.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'majutsushi/tagbar'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'JamshedVesuna/vim-markdown-preview'
"Plugin 'Shougo/deoplete.nvim'

" JavaScript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'geekjuice/vim-mocha'

" Golang plugins
Plugin 'fatih/vim-go'
"Plugin 'nsf/gocode'
"Plugin 'zchee/deoplete-go'
call vundle#end()
filetype plugin indent on
" ------------------------------


syntax on
set background=dark
set number          " Show line numbers
set mouse=a
set tabstop=4 shiftwidth=4 expandtab
set nowrap          " Don't wrap lines
set splitbelow
set splitright
set t_Co=256
set cursorline      " Highlight current line

" ----------[ Search Options]----------
set hlsearch        " Highlight search terms
set incsearch       " Incremental search
set ignorecase      " These two options make search case-insensitive
set smartcase       " unless the search pattern contains uppercase letters
" ------------------------------


" Set the font
if has("gui_running")
    let os = substitute(system('uname'), "\n", "", "")
    if os == "Linux"
        set guifont=Hack\ Regular\ 12
    else
        set guifont=Hack\ Regular:h12
    endif
endif


" Change the terminal's title
set title


" Hides buffers instead of closing them.
" This means that we can have unwritten changes to a file
" and open a new file using :e without being forced
" to write or undo changes first :)
set hidden


" When pasting text into a terminal-based Vim with a right mouse click,
" Vim cannot know it is coming from a paste and messes up indentation.
" By pressing F2 we can enter 'paste mode', paste the text, and press F2
" again to return into normal mode.
set pastetoggle=<F2>


" Set appropriate tabs for JavaScript and Ruby
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab


" Set the theme if the terminal emulator supports 256 colours
" or if using the GUI version of Vim
if &t_Co >= 256 || has("gui_running")
    colorscheme atom-dark-256
endif


" Limit line length of git commits to 72 cols
au FileType gitcommit set tw=72


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


" ----------[ The Silver Searcher ]----------
" [ https://github.com/ggreer/the_silver_searcher ]
"
" Code from: https://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" -------------------------------------------


" ----------[ netrw ]----------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
" augroup END
" -----------------------------


" ----------[ Airline ]----------
set laststatus=2    " This is required by vim-airline
let g:airline_theme='hybrid'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" -------------------------------


" ----------[ CTags ]----------
set tags=./tags,tags;$HOME

" Make Ctrl-] work with overloads
:function! TSFunc()
    execute "ts " . expand('<cword>')
:endfunction
map <C-]> :call TSFunc()<CR>
" -----------------------------


" ----------[ CtrlP ]----------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" -----------------------------


" ----------[ deoplete ]----------
let g:deoplete#enable_at_startup = 1

" Use <Tab> for auto-completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" --------------------------------


" ----------[ Fugitive ]----------
set statusline+=%{fugitive#statusline()}

" Define 'Gg' to make a new window for 'git grep' results
:command! -nargs=+ Gg execute 'silent Ggrep!' <q-args> | cw | redraw!
" --------------------------------


" ----------[ GitGutter ]----------
set updatetime=250
" ---------------------------------


" ----------[ NERDTreeTabs ]----------
map <leader>n <plug>NERDTreeTabsToggle<CR>
" ------------------------------------


" ----------[ NERD Commenter ]----------
" Comment/uncomment lines with <leader>cc
nmap <leader>cc <Plug>NERDCommenterInvert
" --------------------------------------


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

let g:syntastic_go_checkers = ['golint']

" Automatically select JavaScript linter for each buffer
autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs', 'jshint'] : ['eslint']
" ---------------------------------


" ----------[ Tagbar ]----------
nmap <F8> :TagbarToggle<CR>


" Configuration for gotags [ https://github.com/jstemmer/gotags ]
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" ------------------------------


" ----------[ vim-mocha ]----------
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

"let g:mocha_js_command = "!mocha --recursive --no-colors {spec}"
let g:mocha_js_command = "!mocha --recursive {spec}"
" ---------------------------------


" ------------[ vim-go ]------------

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

autocmd FileType go nmap <silent> <leader>gb <Plug>(go-build)
autocmd FileType go nmap <leader>gr <Plug>(go-run)
autocmd FileType go nmap <leader>gt <Plug>(go-test)
" ----------------------------------


" -----[ vim-markdown-preview ]-----
"let vim_markdown_preview_browser = 'Google Chrome'
let vim_markdown_preview_github = 1
" ----------------------------------

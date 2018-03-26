" ---------------------[ Base configuration ]---------------------
set nocompatible        " Always use viMproved
filetype off
" ----------------------------------------------------------------

" --------------------[ Vundle ]--------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf.vim'
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
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'w0rp/ale'               " Asynchronous Lint Engine
Plugin 'JamshedVesuna/vim-markdown-preview'

" JavaScript plugins
Plugin 'pangloss/vim-javascript'
Plugin 'geekjuice/vim-mocha'

" Golang plugins
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on
" --------------------------------------------------

" ------------------[ Generic Options ]------------------
syntax on
set background=dark
set copyindent          " Make autoindent use the same chars as prev line
set cursorline          " Highlight current line
set mouse=a
set number              " Show line numbers
set wrap                " Wrap lines (disable with 'setnowrap')
set linebreak           " When wrapping text, consider word boundaries
set showmatch           " Hilight matching braces/parens/etc.
set splitbelow
set splitright
set t_Co=256
set tabstop=4 shiftwidth=4 expandtab
set title               " Change the terminal's title



" Set the font
if has("gui_running")
    let os = substitute(system('uname'), "\n", "", "")
    if os == "Linux"
        set guifont=Hack\ Regular\ 12
    else
        set guifont=Hack\ Regular:h12
    endif
endif

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


" Folding options
set foldmethod=syntax
set nofoldenable
" -------------------------------------------------------


" ------------------[ Search Options ]-------------------
set hlsearch        " Highlight search terms
set incsearch       " Incremental search
set ignorecase      " These two options make search case-insensitive
set smartcase       " Case-insensitive, unless the search pattern contains uppercase letters
" -------------------------------------------------------


" ------------------[ QuickFix window ]------------------
"autocmd FileType qf setlocal number nolist scrolloff=0  " Don't scroll too much
"autocmd Filetype qf wincmd J " Makes sure it's at the bottom of the vim window

map <C-c> :cclose <CR>    " Close the QuickFix window 
" -------------------------------------------------------


" ----------[ Key Mappings ]----------

" Set the <leader> to , (comma)
let mapleader=","

" Edit / Reload the .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Show the buffers with F5 and prepare to switch/delete
nnoremap <F5> :buffers<CR>:b

" Bind K to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nmap <Leader>F :Ack! "\b<cword>\b" <CR>

" Bind <leader>jt to json_pp, to format JSON
map <leader>jt  <Esc>:%!json_pp -f json -t json<CR>
" ------------------------------------


" -----------------[ ACK ] ----------------- 
" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'
" ------------------------------------------


" -----------------[ FZF ]-----------------
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf

"    -- Key bindings --
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>e :Tags<CR>
nmap <Leader>a :Ag<CR>
" -----------------------------------------


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


" -----------------[ ALE (Asynchronous Lint Engine) ]-----------------
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

" By default, all linters are enabled.
" To selectively enable only some of them, list them here:
"
let g:ale_linters = {
           \ 'javascript': ['eslint'],
           \}
" --------------------------------------------------------------------


" ----------[ CTags ]----------
set tags=./tags,tags;$HOME

" Make Ctrl-] work with overloads
:function! TSFunc()
    execute "ts " . expand('<cword>')
:endfunction
map <C-]> :call TSFunc()<CR>
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

"autocmd FileType go nmap <silent> <leader>gb <Plug>(go-build)
"autocmd FileType go nmap <leader>gr <Plug>(go-run)
"autocmd FileType go nmap <leader>gt <Plug>(go-test)
autocmd FileType go nmap <silent> <leader>gb :GoBuild<CR>
autocmd FileType go nmap <leader>gr :GoRun<CR>
autocmd FileType go nmap <leader>gt :GoTest<CR>
autocmd FileType go nmap <leader>ge :GoCoverage<CR>

" ----------------------------------


" -----[ vim-markdown-preview ]-----
let vim_markdown_preview_browser = 'Google Chrome'
let vim_markdown_preview_github = 1
let vim_markdown_preview_hotkey='<C-m>'
" ----------------------------------


" --------[ vim-workspace ]--------
nnoremap <leader>w :ToggleWorkspace<CR>
nnoremap <leader>x :CloseHiddenBuffers<CR>
" ---------------------------------



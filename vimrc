" Generic options
set nocompatible    " always use viMproved
filetype off


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
Plugin 'pangloss/vim-javascript'
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

if has("gui_running")
    let os = substitute(system('uname'), "\n", "", "")
    if os == "Linux"
        set guifont=Hack\ Regular\ 12
    else
        set guifont=Hack\ Regular:h12
    endif
endif

set title           " Change the terminal's title

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


" ----------[ Key Mappings ]----------

" Set the <leader> to , (comma)
let mapleader=","

" Edit / Reload the .vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Show the buffers with F5 and prepare to switch/delete
nnoremap <F5> :buffers<CR>:b

" ------------------------------------


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


" ----------[ CtrlP ]----------
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" -----------------------------


" ----------[ NERDTreeTabs ]----------
map <leader>n <plug>NERDTreeTabsToggle<CR>
" ------------------------------------


" ----------[ NERD Commenter ]----------
" Comment/uncomment lines with <leader>cc
nmap <leader>cc <Plug>NERDCommenterInvert
" --------------------------------------


" ----------[ Fugitive ]----------
set statusline+=%{fugitive#statusline()}
" --------------------------------


" ----------[ GitGutter ]----------
set updatetime=250
" ---------------------------------


" ----------[ Tagbar ]----------
nmap <F8> :TagbarToggle<CR>
" ------------------------------


" ----------[ Syntastic ]----------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Make sure to do: npm install -g eslint jscs, jshint
let g:syntastic_javascript_checkers = ['eslint', 'jscs', 'jshint']
let g:syntastic_aggregate_errors = 1

" Automatically select JavaScript linter for each buffer
autocmd FileType javascript let b:syntastic_checkers = findfile('.jscsrc', '.;') != '' ? ['jscs', 'jshint'] : ['eslint']
" ---------------------------------

" When editing JavaScript, set appropriate tab width
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2


" Set the theme if the terminal emulator supports 256 colours
" or if using the GUI version of Vim
if &t_Co >= 256 || has("gui_running")
    colorscheme atom-dark-256
endif


" Limit line length of git commits to 72 cols
au FileType gitcommit set tw=72


" ----------[ CTags ]----------
set tags=./tags,tags;$HOME

" Make Ctrl-] work with overloads
:function! TSFunc()
    execute "ts " . expand('<cword>')
:endfunction
map <C-]> :call TSFunc()<CR>
" -----------------------------


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


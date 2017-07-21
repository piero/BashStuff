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
Plugin 'pangloss/vim-javascript'
Plugin 'geekjuice/vim-mocha'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/denite.nvim'
Plugin 'fatih/vim-go'
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


" Set appropriate tab width for JavaScript and Ruby
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2


" Set the theme if the terminal emulator supports 256 colours
" or if using the GUI version of Vim
if &t_Co >= 256 || has("gui_running")
    colorscheme atom-dark-256
endif


" Limit line length of git commits to 72 cols
au FileType gitcommit set tw=72


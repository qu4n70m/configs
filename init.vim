" Plugins
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'numToStr/Comment.nvim'
call plug#end()


" Configuration
set clipboard=unnamedplus
syntax on
" allow file type detection
filetype on
" Enable loading plugin file
filetype plugin on
filetype plugin indent on

colorscheme habamax
set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set hlsearch                " highlight search results
set incsearch               " highlight saerch results while searching.
set inccommand=nosplit      " highlight search results while sustitude.
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
" set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set foldmethod=indent       " setting folding to indentations
set foldlevel=20            " unfold all folds by default
set foldignore=             " this is to ignore the # when folding!! so goood!!!
set splitright              " split to the right.
set splitbelow              " the default split direction will be at the bottom
set mouse=a                 " enable mouse support (selection, resize).
set tags=tags               " enable ctags

" -- Status Line --
set statusline=
set statusline+=\ %n        " buffer number
set statusline+=\ %M        " is the file has being modified?
set statusline+=\ %y        " the file type
set statusline+=\ %r        " is read-only?
set statusline+=\ %f        " relative file path
set statusline+=%=          " all settings after this are alligned right
set statusline+=\ %l:%c     " show line:column
set statusline+=\ [%p%%]    " the precentage we in the file 

" Key maps
let mapleader=" "
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>s :Lines .<CR>
nnoremap <silent> <leader>a :Rg<CR>
nnoremap <silent> <leader>r :edit!<CR>
nnoremap <silent> <leader>j :%!jq .<CR>

lua require('Comment').setup()


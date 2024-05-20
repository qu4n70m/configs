" Plugins
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'rebelot/kanagawa.nvim'
Plug 'preservim/nerdtree'
call plug#end()


" Configuration
set clipboard=unnamedplus
syntax on
" allow file type detection
filetype on
" Enable loading plugin file
filetype plugin on
filetype plugin indent on

colorscheme kanagawa-wave 
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
" set foldmethod=indent       " setting folding to indentations
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable            " Disable folding at startup.
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


" Functions
" function! FzfGitLines()
"   let git_root = system('git -C ' . expand('%:p:h') . ' rev-parse --show-toplevel')[:-2]
"   execute 'Lines ' . git_root
" endfunction
"

command! -nargs=0 FzfGitLines call fzf#run(fzf#wrap({'source': 'rg "" ' . system('git -C ' . expand('%:p:h') . ' rev-parse --show-toplevel')[:-2], 'sink': 'e', 'options': '--delimiter : --preview "bat --style=numbers --color=always {1}"'}))

command! -nargs=+ -complete=file RgGit call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>).' $(git rev-parse --show-toplevel)', 1, <bang>0)
" Key maps
let mapleader=" "
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>s :Lines<CR>
" nnoremap <silent> <leader>g :RgGit<CR>
nnoremap <silent> <leader>g :execute 'RgGit ' . expand('<cword>')<CR>
nnoremap <silent> <leader>a :Rg<CR>
nnoremap <silent> <leader>r :edit!<CR>
nnoremap <silent> <leader>j :%!jq .<CR>

" Setup

lua require('Comment').setup()

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust", "python", "javascript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option mayslow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF



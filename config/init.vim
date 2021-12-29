syntax on

set nocompatible
filetype plugin on
set encoding=utf-8 nobomb
set t_Co=256
set number
set relativenumber
set showmode
set showcmd
set gcr=n:blinkon0
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set autoindent
set cindent
set noswapfile
set nobackup
set nowb
set scrolloff=4
set ttyfast
set history=3000
set mouse=
set wildmenu
set nojoinspaces
set autoread
set ignorecase
set smartcase
set incsearch
set splitright
set splitbelow
set synmaxcol=2500


" Set leader to ,
let mapleader = ','

" Shortcut to open GitHub repo (using https://github.com/github/hub)
map <leader>hb :!hub browse<CR>
nnoremap Y y$
nnoremap j gj
nnoremap k gk


" Load plugins.
lua require('plugins')

" Shortcut to comment stuff
map <leader>cc :TComment<CR>

" Local configuration file and shortcut to open it.
nmap <leader>rc :tabedit ~/.config/nvim/local.vim<CR>
if filereadable(glob('~/.config/nvim/local.vim'))
	source ~/.config/nvim/local.vim
endif
set nocompatible
set encoding=utf-8 nobomb
set t_Co=256
set number
syntax on
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
set scrolloff=2
set ttyfast
set history=3000
set mouse=
set ignorecase
set smartcase
nnoremap j gj
nnoremap k gk
nnoremap Y y$
let mapleader = ','
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit,markdown setlocal spell
map <leader>W :w !sudo tee %<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

source ~/.vim/bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

colorscheme Tomorrow-Night-Bright

" Use the system clipboard
set clipboard=unnamed
if has('unnamedplus')
	set clipboard+=unnamedplus
endif

if has('autocmd')
	" Enable JavaScript syntax on `.json` files
	autocmd BufRead,BufNewFile *.json,.jshintrc,.jscsrc set filetype=json
endif

nmap <leader>stt :SyntasticToggleMode<CR>
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html', 'json'] }
let g:syntastic_haskell_checkers = ['hlint', 'hdevtools']

set laststatus=2
let g:Powerline_symbols = 'fancy'

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

map <leader>cc :TComment<CR>

if filereadable(glob('~/.vimrc.local'))
    source ~/.vimrc.local
endif

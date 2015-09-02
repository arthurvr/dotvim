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
set scrolloff=4
set ttyfast
set history=3000
set mouse=
set wildmenu
set nojoinspaces
set autoread
set synmaxcol=2500

let mapleader = ','
nnoremap Y y$
map <leader>W :w !sudo tee %<CR>
map <leader>E :call ExecFile()<CR>
map <leader>T :call RunTests()<CR>
nmap <leader>stt :SyntasticToggleMode<CR>
nnoremap j gj
nnoremap k gk
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>
map <leader>cc :TComment<CR>

autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit,markdown setlocal spell
autocmd BufRead,BufNewFile *.json,.jshintrc,.jscsrc,.eslintrc set filetype=json

set ignorecase
set smartcase
set incsearch

set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000

source ~/.vim/plugins/pathogen/autoload/pathogen.vim
execute pathogen#infect('plugins/{}')

colorscheme Tomorrow-Night-Bright

" Use the system clipboard
set clipboard=unnamed
if has('unnamedplus')
	set clipboard+=unnamedplus
endif

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html', 'json'] }
let g:syntastic_haskell_checkers = ['hlint', 'hdevtools']

set laststatus=2
let g:Powerline_symbols = 'fancy'

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

if has('gui_running')
	set guifont=Menlo:h13
	set linespace=8
endif

function! ExecFile()
	" Determine what command to use
	if &ft == "javascript"
		let cmd = "node"
	elseif &ft == "ruby"
		let cmd = "ruby"
	elseif &ft == "python"
		let cmd = "python"
	elseif &ft == "zsh"
		let cmd = "zsh"
	elseif &ft == "haskell"
		let cmd = "runhaskell"
	elseif &ft == "php"
		let cmd = "php"
	elseif &ft == "rust"
		let cmd = "cargo run"
	endif

	exec ":w"

	" Clear the screen and execute the current file using the command
	exec "!clear && " . cmd . " %"
endfunction

function! RunTests()
	" Determine what command to use
	if &ft == "javascript"
		let cmd = "npm test"
	elseif &ft == "rust"
		let cmd = "cargo test"
	endif

	exec ":w"

	" Clear the screen and execute the current file using the command
	exec "!clear && " . cmd
endfunction

if filereadable(glob('~/.vimrc.local'))
	source ~/.vimrc.local
endif

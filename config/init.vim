syntax on

set nocompatible
filetype plugin on
set t_Co=256
set number
set relativenumber
set showmode
set showcmd
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


" Todo: use this to install Packer
" https://github.com/wbthomason/packer.nvim#bootstrapping
" Load plugins.
lua require('plugins')

" Auto-format rust code
let g:rustfmt_autosave = 1

" Shortcut to update plugins
map <leader>up :PackerUpdate<CR>

" Hide search result
map <leader>nh :nohlsearch<CR>

" Shortcut to comment stuff
map <leader>cc :TComment<CR>

" LeaderF shortcuts
let g:Lf_ShortcutF = "<leader>notused"
map <leader>ff :Leaderf file --popup<CR>
map <leader>fr :Leaderf mru --popup<CR>
map <leader>fg :Leaderf rg --popup<CR>

" Shortcut to open float-term
map <leader>te :FloatermNew<CR>

" Automatically run rustfmt on .rs files!
let g:rustfmt_autosave = 1

" Function to quickly run tests using a default command.
function! ExecTests()
	if &ft == "rust"
		exec ":w"
		exec ":FloatermNew cargo test"
	endif
endfunction
map <leader>t :call ExecTests()<CR>

" Function to quickly execute a file in a floating terminal window
function! ExecFile()
	if &ft == "rust"
		exec ":w"
		exec ":FloatermNew cargo run"
	elseif &ft == "haskell"
		exec ":w"
		exec ":FloatermNew --autoclose=0 runhaskell %"
	elseif &ft == "python"
		exec ":w"
		exec ":FloatermNew --autoclose=0 python3 %"
	elseif &ft == "cpp"
		exec ":w"
		exec ":FloatermNew --autoclose=0 g++ -std=c++17 -o demo % && ./demo"
	elseif &ft == "scala"
		exec ":w"
		exec ":FloatermNew --autoclose=0 scala %"
	elseif &ft == "zinc"
		exec ":w"
		exec ":FloatermNew --autoclose=0 minizinc %"
	elseif &ft == "markdown"
		exec ":w"
		exec ":Glow %"
	elseif &ft == "scheme"
		exec ":w"
		exec ":FloatermNew --autoclose=0 racket %"
	else
		if &ft == "java"
			let cmd = "javac % && java %:t:r"
		endif

		exec ":w"
		exec ":FloatermNew --autoclose=2 " . cmd . " && exit &> /dev/null"
	endif
endfunction
map <leader>e :call ExecFile()<CR>

" Ultisnips configuration
let g:UltiSnipsSnippetDirectories=['~/.config/nvim/my_snippets/']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Shortcut to open my snippets folder
nmap <leader>sn :tabedit ~/.config/nvim/my_snippets/<CR>

" Lualine setup
lua << END
require('lualine').setup {
	options = { theme = 'codedark' }
}
END

" Local configuration file and shortcut to open it.
nmap <leader>rc :tabedit ~/.config/nvim/local.vim<CR>
if filereadable(glob('~/.config/nvim/local.vim'))
	source ~/.config/nvim/local.vim
endif

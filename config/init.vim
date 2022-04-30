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
	elseif &ft == "markdown"
		exec ":w"
		exec ":Glow %"
	else
		if &ft == "haskell"
			let cmd = "runhaskell %"
		elseif &ft == "java"
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

" Automatically apply C syntax to IDP files.
" IDP doesn't even resemble C (lol), but it works better than not having any
" highlighting imho.
" In the future, someone might like to take over the syntax description from
" the official IDP IDE.
autocmd BufNewFile,BufRead *.idp   set syntax=c

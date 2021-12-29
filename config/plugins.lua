vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- TComment
	use 'tomtom/tcomment_vim'

	-- Lots of color schemes
	use 'flazz/vim-colorschemes'

	-- EditorConfig
	use 'editorconfig/editorconfig-vim'

	-- Haskell special characters goodness
	use 'enomsg/vim-haskellConcealPlus'

	-- LeaderF fuzzy finder
	use({ "Yggdroot/LeaderF", run = ":LeaderfInstallCExtension" })

	-- Icons! Used in alpha-nvim
	use {'kyazdani42/nvim-web-devicons', event = 'VimEnter'}

	-- Alpha!
	use {
		'goolord/alpha-nvim',
		config = [[require('alpha-nvim')]]
	}

	-- Floating terminal windows
	use 'voldikss/vim-floaterm'
end)

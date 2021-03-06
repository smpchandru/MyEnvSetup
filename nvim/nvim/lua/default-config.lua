CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

O = {
    colorscheme = 'nvcode',
	leader_key =' ',
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    cursorline = true,
    shell = 'bash',
    timeoutlen = 100,
	lsp_client = 'coc', -- allowed values 'native' | 'coc'
	auto_complete = false,
    nvim_tree_disable_netrw = 0,
    database = {save_location = '~/.config/nvcode_db', auto_execute = 1},
	inlineBlame = false,
    plugin = {
        hop = {enable = false},
        matchup = {enable = true},
		surround = { enable = false },
		vim_repeat = { enable = false },
		tagbar = { enable = false },
		nerdcommenter = { enable = false },
		highlightedyank = { enable = false },
		startify = { enable = false },
		devicons = { enable = false },
		tabular	 = { enable = false },
		fugitive	 = { enable = false },
		smoothie	 = { enable = false },
		easyclip	 = { enable = false },
		vim_rhubarb	 = { enable = false },
		gitsigns	 = { enable = false },
		gitmessenger	 = { enable = false },
		neogit	 = { enable = false },
		easy_search	 = { enable = false },
		easy_motion	 = { enable = false },
		sneak	 = { enable = false },
		fzf	 = { enable = false },
		bqbf	 = { enable = false },
		vim_grepper	 = { enable = false },
		telescope	 = { enable = false },
		vim_peekup	 = { enable = false },
		quick_scope	 = { enable = false },
		choosewin	 = { enable = false },
		vim_go	 = { enable = false },
		galaxyline	 = { enable = false },
		barbar	 = { enable = false },
		coc	 = { enable = false },
		sumneko	 = { enable = false },
		markdown_preview	 = { enable = false },
		floaterm	 = { enable = false },
		nuake	 = { enable = false },
		nvimtree	 = { enable = false },
		nvcode	 = { enable = false },
		zenmode	 = { enable = false },
		treesitter	 = { enable = false },
		indentblankline	 = { enable = false },
		whichkey	 = { enable = false },
		visul_multi	 = { enable = false },
	    vcolor		 = { enable = false },
	    codedark		 = { enable = false },
	    puml_syntax		 = { enable = false },
	    popup		 = { enable = false },
	    radical		 = { enable = false },
	    delve		 = { enable = false },
	    spectre		 = { enable = false },
	    symbol_outline       = { enable = false },
	    neoscroll       = { enable = false },
	    nrrwRgn		 = { enable = false }
    },
}


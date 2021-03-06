local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
  return
end

packer.init {
  -- compile_path = vim.fn.stdpath('data')..'/site/pack/loader/start/packer.nvim/plugin/packer_compiled.vim',
  compile_path = require("packer.util").join_paths(vim.fn.stdpath "config", "plugin", "packer_compiled.vim"),
  git = { clone_timeout = 300 },
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
  },
}

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require('packer').startup({function(use)
	-- Packer can manage itself as an optional plugin
	use 'wbthomason/packer.nvim'
	use {
		'tpope/vim-surround',
		disable = not O.plugin.surround.enable
	}
	use {
		'tpope/vim-repeat',
		disable = not O.plugin.vim_repeat.enable
	}
	use {
	 	'majutsushi/tagbar',
		disable = not O.plugin.tagbar.enable
	}
	use {
		'scrooloose/nerdcommenter',
		disable = not O.plugin.nerdcommenter.enable
	}
	use {
		'machakann/vim-highlightedyank',
		disable = not O.plugin.highlightedyank.enable
	}
	use {
		'svermeulen/vim-easyclip',
		disable = not O.plugin.easyclip.enable
	}
	use {
		'tpope/vim-rhubarb',
		disable = not O.plugin.vim_rhubarb.enable
	}
	--use 'tpope/vim-unimpaired'
	use {
		'smpchandru/vim-code-dark',
		disable = not O.plugin.codedark.enable
	}
	use {
		'aklt/plantuml-syntax',
		ft='puml',
		disable = not O.plugin.puml_syntax.enable
	}
	use {
		'mhinz/vim-startify',
		disable = not O.plugin.startify.enable
	}
	use {
		'ryanoasis/vim-devicons',
		disable = not O.plugin.devicons.enable
	}
	use {
		'godlygeek/tabular',
		disable = not O.plugin.tabular.enable,
		cmd='Tabularize'
	}
	use {
		'nvim-lua/popup.nvim',
		disable = not O.plugin.popup.enable,
	}
	use{
		'psliwka/vim-smoothie',
		disable = not O.plugin.smoothie.enable,
	}
	use{
		'karb94/neoscroll.nvim',
		config = function ()
			require('ch-neoscroll')
		end,
		disable = not O.plugin.neoscroll.enable
	}
	-- Convert numbers for diffrent base like octal,binary, decimal etc (A show all version of number)
	use {
		'glts/vim-radical',
		disable = not O.plugin.radical.enable,
		requires = 'glts/vim-magnum'
	}

	--lsp related
	if O.lsp_client == 'native'
	then
		use {
			"neovim/nvim-lspconfig"
		}
		use { "glepnir/lspsaga.nvim" }
		use { "kabouzeid/nvim-lspinstall"}
		use {
			"hrsh7th/nvim-compe",
			event = "InsertEnter",
			config = function()
				require("ch-compe").config()
			end
		}
		use {
			'ray-x/lsp_signature.nvim',
			config = function ()
				require('ch-signature').config()
			end
		}
		-- Symbol Outline
		use {
			"simrat39/symbols-outline.nvim",
			cmd = "SymbolsOutline",
			config = function() require'ch-symboloutline' end,
			disable = not O.plugin.symbol_outline.enable
		}
		require('lsp')
	elseif O.lsp_client == 'coc'
	then
		use {
			'neoclide/coc.nvim',branch='release',
			disable = not O.plugin.coc.enable,
			config= function() vim.cmd('source $HOME/.config/nvim/vimscripts/coc.vim') end,
			requires= 'antoinemadec/coc-fzf'
		}
	end
	use{
		'sumneko/lua-language-server',
		disable = not O.plugin.sumneko.enable,
	}
	-- git related
	use {
		'tpope/vim-fugitive',
		requires= 'tommcdo/vim-fubitive',
		disable = not O.plugin.fugitive.enable
	}
	use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("ch-gitsign").config()
        end,
		requires = {
			'nvim-lua/plenary.nvim'
		},
		disable = not O.plugin.gitsigns.enable,
        event = "BufRead"
	}
	use {
		'rhysd/git-messenger.vim',
		disable = not O.plugin.gitmessenger.enable,
	}
	use {
		'TimUntersberger/neogit',
		requires = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim'
		},
		disable = not O.plugin.neogit.enable,
		config = function() require('ch-neogit') end
	}

	-- search related
	use {
		'eugen0329/vim-esearch',
		disable = not O.plugin.easy_search.enable,
		config = function() require('ch-easysearh') end
	}
	use {
		'easymotion/vim-easymotion',
		disable = not O.plugin.easy_motion.enable
	}
	use {
		'justinmk/vim-sneak',
		disable = not O.plugin.sneak.enable
	}
	use {
		'junegunn/fzf.vim',
		--run = {function() vim.fn['firenvim#install'](0) end},
		disable = not O.plugin.fzf.enable,
		requires = {
			{'junegunn/fzf', run= function() vim.fn['fzf#install'](0) end,
			{'voldikss/fzf-floaterm'},
			{'yuki-yano/fzf-preview.vim',  branch= 'release/rpc' }
			}
		},
		config = function() vim.cmd('source $HOME/.config/nvim/vimscripts/fzf.vim') end
	}
	use{
		'kevinhwang91/nvim-bqf',
		disable = not O.plugin.bqbf.enable,
	}
	use {
		'mhinz/vim-grepper',
		disable = not O.plugin.vim_grepper.enable,
	}

	use {
		'nvim-telescope/telescope.nvim',
		config = function() require('ch-telescope') end,
		disable = not O.plugin.telescope.enable,
		requires = {
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-fzf-writer.nvim"
		}
	}
	use { 'unblevable/quick-scope',
		config = function () require('ch-quickscope') end,
		disable = not O.plugin.quick_scope.enable,
	}
	use{
		'gennaro-tedesco/nvim-peekup',
		disable = not O.plugin.vim_peekup.enable
	}
	use {
		'phaazon/hop.nvim',
		event = 'BufRead',
        config = function()
            require('ch-hop').config()
        end,
		disable = not O.plugin.hop.enable,
        opt = true
	}
	-- select wondow
	use {
		't9md/vim-choosewin',
		disable = not O.plugin.choosewin.enable,
	}


	-- golang related
	use {
		'fatih/vim-go',
		ft='go',
		disable = not O.plugin.vim_go.enable,
		config = function() require('ch-vimgo') end
	}
	use {
		'sebdah/vim-delve',
		disable = not O.plugin.delve.enable,
		ft='go'
	}
	-- status/tab line
	use {
		'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function() require'ch-galaxyline' end,
		disable = not O.plugin.galaxyline.enable,
		-- some optional icons
		requires = {
			{'kyazdani42/nvim-web-devicons', opt = true},
		}
	}
 	use {
		'romgrk/barbar.nvim',
		disable = not O.plugin.barbar.enable
	}


	-- markdown
	use {
		'iamcco/markdown-preview.nvim',
		ft='markdown',
		run= function() vim.fn['mkdp#util#install']() end ,
		disable = not O.plugin.markdown_preview.enable,
	}

	-- terminal related
	--use 'Lenovsky/nuake'
	use {
		'voldikss/vim-floaterm',
		disable = not O.plugin.floaterm.enable,
		config = function() require('ch-floaterm').config() end
	}

	-- Explorer related
	use {
		'kyazdani42/nvim-tree.lua',
		disable = not O.plugin.nvimtree.enable,
        config = function()
            require("ch-nvtree").config()
        end
	}

	-- appearance and color schmes
	use {
		'christianchiarulli/nvcode-color-schemes.vim',
		disable = not O.plugin.nvcode.enable,
	}
    -- Zen Mode TODO this don't work with whichkey might gave to make this built in
    use {
        "Pocco81/TrueZen.nvim",
        -- event = 'BufEnter',
        cmd = {"TZAtaraxis"},
        config = function()
           require('ch-zen').config()
        end,
		event = "BufEnter",
		disable = not O.plugin.zenmode.enable,
    }
	use {
		'nvim-treesitter/nvim-treesitter',
	    run=':TSUpdate',
		config = function() require('ch-treesitter').config() end,
		requires = {
	 		'nvim-treesitter/nvim-treesitter-refactor',
	 		'nvim-treesitter/nvim-treesitter-textobjects',
			'p00f/nvim-ts-rainbow'
		},
		disable= not O.plugin.treesitter.enable
	}

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require('ch-indentline').config() end,
		disable= not O.plugin.indentblankline.enable
	}
	use {
		'folke/which-key.nvim',
		config = function () require('ch-whichkey').config() end,
		--config = function () vim.cmd() end,
		--config = function() vim.cmd('source $HOME/.config/nvim/vimscripts/whichkey/init.vim') end,
		disable= not O.plugin.whichkey.enable
	}
	use{
		'mg979/vim-visual-multi',
		disable= not O.plugin.visul_multi.enable
	}
	use {
		'KabbAmine/vCoolor.vim',
		disable= not O.plugin.vcolor.enable
	}
	use {
		'chrisbra/NrrwRgn',
		disable= not O.plugin.nrrwRgn.enable
	}
	use {
        'andymass/vim-matchup',
        event = "CursorMoved",
        config = function()
            require('ch-matchup').config()
        end,
        disable = not O.plugin.matchup.enable
    }
	 -- Search & Replace
    use {
        'windwp/nvim-spectre',
        event = "BufRead",
        config = function()
            require('ch-spectre').config()
        end,
        disable = not O.plugin.spectre.enable
    }

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}})

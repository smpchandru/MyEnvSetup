require('plugins')
require('options')
require('keybindings')
require('autocomands')
require('ch-easysearh')
require('ch-vimgo')
require('ch-nvtree')
require('ch-gitsign')
require('ch-quickscope')
require('ch-treesitter')
vim.cmd('source $HOME/.config/nvim/vimscripts/settings.vim')
vim.cmd('source $HOME/.config/nvim/vimscripts/functions.vim')
vim.cmd('source $HOME/.config/nvim/vimscripts/vis.vim')
vim.cmd('source $HOME/.config/nvim/vimscripts/misc.vim')
require('ch-telescope')

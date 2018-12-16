let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
set nu
set ts=4
set sw=4
set tw=78
set cindent  "always set indentation on "
set comments=sl:/*,mb:**,elx:*
:set ruler
set hlsearch
set expandtab
set diffopt+=iwhite
:syntax on
"set colorcolumn=80
highlight ColorColumn ctermbg=1
set backspace=2
"map leader key
let mapleader = ","
let maplocalleader = ";"

"BuffExplore settings
"noremap <Leader>b :ToggleBufExplorer<cr>
"Bufferline settings
"let g:bufferline_echo = 1
"let g:bufferline_active_buffer_left = '['
"let g:bufferline_active_buffer_right = ']'
"let g:bufferline_modified = '+'
"let g:bufferline_show_bufnr = 1
"Git key maoings
noremap <Leader>gd :Gdiff<cr>
noremap <Leader>gb :Gblame<cr>
noremap <Leader>ga :Gadd<cr>
noremap <Leader>gc :Gcommit<cr>
noremap <Leader>gl :Glog<cr>
" Search patterns in visully selected texts
" copied from http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy/<C-R><C-R>=substitute(
			\escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
			\let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
			\gvy?<C-R><C-R>=substitute(
			\escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
			\gV:call setreg('"', old_reg, old_regtype)<CR>

":nnoremap H gT
":nnoremap L gt
:set is
" Function key mappings Explained "
" ---------------------------------"
" <F3> - finding functions calling this function
" <F4> - finding this C symbol
" <F5> - finding an egrep pattern
" <F6> - finding a  file
" <F7> - finding a definition
" <F8> - finding assignments to a particular variable

"if strlen($CODE_ROOT) > 0
"
"    " setting paths to the cscope and the tag databases ..
"
"    set tags=$CODE_ROOT/tags
"    set tags=$CODE_ROOT/TAGS
"    set path+=$CODE_ROOT/
"    set cscopetag
"    cs add  $CODE_ROOT/cscope.out $CODE_ROOT/
"
"    " Adding mappings for working with cscope and tag databases ...
"    :noremap <F3> : scs f c <C-R>=expand("<cword>")<CR><CR>
"    :noremap <F4> : scs f s <C-R>=expand("<cword>")<CR><CR>
"    :noremap <F5> : scs f e <C-R>=expand("<cword>")<CR><CR>
"    :noremap <F6> : scs f f <C-R>=expand("<cword>")<CR><CR>
"    :noremap <F7> : scs f g <C-R>=expand("<cword>")<CR><CR>
"    :noremap <F8> : scs f t <C-R>=expand("<cword>")<CR><CR>
"    :noremap <C-x> : bd<CR>
"
"    " Repository Mappings being added ...
"
"endif  "end repo changes "
"=============================================================================
" all user defined functions
"=============================================================================
function! s:ZoomToggle() abort
	if exists('t:zoomed') && t:zoomed
		execute t:zoom_winrestcmd
		let t:zoomed = 0
	else
		let t:zoom_winrestcmd = winrestcmd()
		resize
		vertical resize
		let t:zoomed = 1
	endif
endfunction
" Toggle mouse enable
" copied from http://unix.stackexchange.com/questions/156707/how-to-toggle-mouse-support-in-vim
function! ToggleMouse()
	" check if mouse is enabled
	if &mouse == 'a'
		" disable mouse
		set mouse=
	else
		" enable mouse everywhere
		set mouse=a
	endif
endfunc
" function to search in range
function! RangeSearch(direction)
	call inputsave()
	let g:srchstr = input(a:direction)
	call inputrestore()
	if strlen(g:srchstr) > 0
		let g:srchstr = g:srchstr.
					\ '\%>'.(line("'<")-1).'l'.
					\ '\%<'.(line("'>")+1).'l'
	else
		let g:srchstr = ''
	endif
endfunction

" function for allign
function! s:align()
	let p = '^\s*|\s.*\s|\s*$'
	if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
		let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
		let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
		Tabularize/|/l1
		normal! 0
		call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
	endif
endfunction

function! AddNerdTreeConf()

	Plug 'scrooloose/nerdtree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	let g:NERDTreeFileExtensionHighlightFullName = 1
	let g:NERDTreeExactMatchHighlightFullName = 1
	let g:NERDTreePatternMatchHighlightFullName = 1
	let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
	let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
	let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
	let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

	let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
	let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

	let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
	let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with
	noremap <Leader>o :NERDTreeToggle<cr>
endfunction
function!     AddCompletionManagerConf()
	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-tmux'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-jedi'

	Plug 'ncm2/ncm2-bufword'
	Plug 'ncm2/ncm2-path'
	Plug 'ncm2/ncm2-github'
	Plug 'ncm2/ncm2-tmux'
	Plug 'ncm2/ncm2-tagprefix'
	Plug 'filipekiss/ncm2-look.vim'
	Plug 'ncm2/ncm2-gtags'
	Plug 'ncm2/ncm2-syntax'
	Plug 'ncm2/ncm2-neoinclude'
	Plug 'wellle/tmux-complete.vim'
	Plug 'yuki-ycino/ncm2-dictionary'
	Plug 'ncm2/ncm2-pyclang'
	Plug 'ncm2/ncm2-go'
	set shortmess+=c

	" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
	inoremap <c-c> <ESC>

	" When the <Enter> key is pressed while the popup menu is visible, it only
	" hides the menu. Use this mapping to close the menu and also start a new
	" line.
	inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

	" Use <TAB> to select the popup menu:
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

	" wrap existing omnifunc
	" Note that omnifunc does not run in background and may probably block the
	" editor. If you don't want to be blocked by omnifunc too often, you could
	" add 180ms delay before the omni wrapper:
	"  'on_complete': ['ncm2#on_complete#delay', 180,
	"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
	au User Ncm2Plugin call ncm2#register_source({
				\ 'name' : 'css',
				\ 'priority': 9, 
				\ 'subscope_enable': 1,
				\ 'scope': ['css','scss'],
				\ 'mark': 'css',
				\ 'word_pattern': '[\w\-]+',
				\ 'complete_pattern': ':\s*',
				\ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
				\ })
	" for c++ compltion uising clang library
	let g:ncm2_pyclang#library_path='/home/chandru/.vim/bundle/youcompleteme/third_party/ycmd/libclang.so.7'
endfunction
"============================================================================================
"These are generic vim settings should work both gui and console applications
"============================================================================================
noremap <Leader>m :call ToggleMouse()<cr>
vnoremap // y/<C-R>"<CR>
nnoremap <silent> <2-LeftMouse> :let @/='\V\<'.escape(expand('<cword>'), '\').'\>'<cr>

vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

set ai
set history=10000
:hi Search cterm=NONE ctermfg=grey ctermbg=blue
"Vundle plugin manager config start
set nocompatible              " be iMproved, required
filetype off                  " required

"   Vim Plug plugin manager
"Plug 'scrooloose/nerdtree' , { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] } "Loads only when opening NERDTree"
call plug#begin('~/.vim/bundle')
	Plug 'tpope/vim-fugitive'
	Plug 'eugen0329/vim-esearch'
	"Plug 'kien/ctrlp.vim'
	Plug 'fatih/vim-go', { 'for' : ['go', 'markdown'] } "Loads only when editing golang files"
	Plug 'nsf/gocode', {'rtp': 'vim/'}
	Plug 'derekwyatt/vim-scala'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'majutsushi/tagbar'
	Plug 'scrooloose/nerdcommenter'
	Plug 'valloric/youcompleteme'
	Plug 'easymotion/vim-easymotion'
	Plug 'trusktr/seti.vim'
	Plug 'jodosha/vim-godebug'
	Plug 'brooth/far.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'mhartington/oceanic-next'
	Plug 'ryanoasis/vim-devicons'
	Plug 'wikitopian/hardmode'
	Plug 'machakann/vim-highlightedyank'
	Plug 'sebdah/vim-delve'
	Plug 'justinmk/vim-sneak'
	Plug 'radenling/vim-dispatch-neovim'
	Plug 'tpope/vim-dispatch'
	Plug 'mhinz/vim-grepper'
	Plug 'svermeulen/vim-easyclip'
	Plug 'kshenoy/vim-signature'
	Plug 'tpope/vim-rhubarb'
	if !exists("g:gui_oni")
		"    call plug#begin('~/.vim/bundle')
		call AddNerdTreeConf()
		"    call plug#end()            " required
		call AddCompletionManagerConf()
	endif

	"Plug 'ensime/ensime-vim'

call plug#end()            " required
filetype plugin indent on    " required
set laststatus=2
set ttimeoutlen=50
nmap <leader>t :TagbarToggle<CR>

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
set breakindent
"GoGuru scope
let g:go_guru_scope = ["github.com/...","golangorg/...","mypractice","..."]
let g:go_list_type = "quickfix"
"visual mode text movement and keep in select
vnoremap <S-TAB> <gv
vnoremap <TAB> >gv

:au FileType go map <localleader>r <Plug>(go-run)
:au FileType go map <localleader>b <Plug>(go-build)
:au FileType go map <localleader>i <Plug>(go-imports)
:au FileType go map <localleader>d <Plug>(go-describe)
:au FileType go map <localleader>dv <Plug>(go-def-vertical)
:au FileType go map <localleader>dh <Plug>(go-def-split)

if !has('nvim')
	set ttymouse=xterm2
endif
set wildmenu
set wildmode=list:longest,full

""" YouCompleteMe
let g:ycm_semantic_triggers =  {
			\   'c' : ['->', '.'],
			\   'go' : ['.'],
			\   'objc' : ['->', '.'],
			\   'cpp,objcpp' : ['->', '.', '::'],
			\   'perl' : ['->'],
			\   'php' : ['->', '::'],
			\   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
			\   'lua' : ['.', ':'],
			\   'erlang' : [':'],
			\ }
"let g:ycm_global_ycm_extra_conf = "/home/vuser/repo/2xx/visp/coco/.ycm_extra_conf.py"
"" turn on completion in comments
"let g:ycm_complete_in_comments=1
"" load ycm conf by default
"let g:ycm_confirm_extra_conf=0
"" turn on tag completion
"let g:ycm_collect_identifiers_from_tags_files=1
"" only show completion as a list instead of a sub-window
"set completeopt-=preview
"" start completion from the first character
"let g:ycm_min_num_of_chars_for_completion=1
"" don't cache completion items
"let g:ycm_cache_omnifunc=0
"" complete syntax keywords
"let g:ycm_seed_identifiers_with_syntax=1
"set nowrapscan
" Disable Arrow keys in Escape mode

:set relativenumber

"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_auto_type_info = 0
let g:go_fmt_command = "goimports"
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
", 'varcheck']
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'varcheck', 'aligncheck', 'ineffassign', 'deadcode','gosimple', 'staticcheck']
let g:go_metalinter_deadline = '10s'
let g:go_metalinter_command = "--exclude=test"
"let g:go_fmt_fail_silently = 1
let @g=':vimgrep // % | copen'
" Zoom / Restore window.
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-A> :ZoomToggle<CR>
"set foldmethod=syntax
set autoindent
set tags+=/home/vuser/repo/2xx/visp/wasp/tags
set shell=/bin/bash
"let g:ycm_show_diagnostics_ui = 0
let g:ycm_complete_in_comments_and_strings=1
let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1

"This assumes your kernel directory has the word 'kernel'
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
hi! Visual ctermbg=023
let g:ycm_python_binary_path='/usr/bin/python3'
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
	set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
" devicons settins
set encoding=UTF-8
let g:WebDevIconsUnicodeDecorateFolderNodes=1
" you can add these colors to your .vimrc to help customizing

"enable vim hard mode
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" toggle the hard mode
"nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
"let g:HardMode_level = 'wannabe'
set backspace=0
" pipe system and vim clipboard
set clipboard+=unnamedplus
set showcmd
"FZZ options
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set inccommand=nosplit
let g:highlightedyank_highlight_duration = 10000
highlight HighlightedyankRegion cterm=reverse gui=reverse

" ============================================================================
" Put gui only settings here
" ============================================================================
if exists("g:gui_oni")
	function! OpenTerminal()
		tabnew | term 
	endfunction
endif

"=============================================================================
"Installed plugin settings
"=============================================================================
let g:sneak#label = 1
"Easy motion across window settings
" <Leader>f{char} to move to {char}
map  <Leader>F <Plug>(easymotion-bd-f)
nmap <Leader>F <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" Gif config
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
" Gif config
map  / <Plug>(easymotion-sn)
map ? <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1
"mapings for leader key combination
"map for Ctrlp
noremap <Leader>b :Buffers<cr>
noremap <Leader>f :Files<cr>
"easy search plugins settings
let g:esearch = {
			\ 'adapter':    'ag',
			\ 'backend':    'vimproc',
			\ 'out':        'win',
			\ 'batch_size': 1000,
			\ 'use':        ['visual', 'hlsearch', 'last'],
			\}

if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	tnoremap <C-v><Esc> <Esc>
endif
:highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
"set undofile
"if !has('nvim')
"    set undodir=~/.vim/undo
"endif
"augroup vimrc
"    autocmd!
"    autocmd BufWritePre /tmp/* setlocal noundofile
"augroup END


"vim airline settings
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '∥'
let g:airline#extensions#tabline#left_alt_sep = '∥'
let g:airline_left_sep = '∥'
let g:airline_right_sep = '∥'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='atomic'
"grepper plugin settins
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)
let g:EasyClipUseSubstituteDefaults=1
nnoremap gm m
let g:EasyClipAutoFormat=1
nmap <leader>cf <plug>EasyClipToggleFormattedPaste
set diffopt=vertical

" ██████╗ ██╗   ██╗██████╗ ██████╗  █████╗ ███████╗
" ██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝
" ██████╔╝██║   ██║██████╔╝██████╔╝███████║███████╗
" ██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔══██║╚════██║
" ██████╔╝╚██████╔╝██████╔╝██████╔╝██║  ██║███████║
" ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
"
"  ██╗███╗   ██╗██╗ ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██╔╝████╗  ██║╚██╗██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║ ██╔██╗ ██║ ██║██║   ██║██║██╔████╔██║██████╔╝██║
" ██║ ██║╚██╗██║ ██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
" ╚██╗██║ ╚████║██╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

" =============================================================================
" PLUGINS
" =============================================================================

" Environmental Setup
" -----------------------------------------------------------------------------
" Set some sane environment values.
set encoding=UTF-8
scriptencoding UTF-8
set t_Co=256

" Use `$nvim -u $(location to vimrc)` to trigger this event.
if has('nvim')
	if empty(glob('~/.config/nvim/init.vim'))
		silent !mkdir -p ~/.config/nvim
		silent !ln -s ~/.vimrc ~/.config/nvim/init.vim
	endif
	if getftype($HOME . '/.config/nvim/init.vim') != 'link'
		silent !rm ~/.config/nvim/init.vim
		silent !ln -s ~/.vimrc ~/.config/nvim/init.vim
	endif
	if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
		silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		" Sourcing the vimrc might not be needed.
		if !$CONTAINER ==? "true"
			autocmd vimEnter * PlugInstall --sync " | source $MYVIMRC
		endif
	endif
else
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		" Sourcing the vimrc might not be needed.
		if !$CONTAINER ==? "true"
			autocmd vimEnter * PlugInstall --sync " | source $MYVIMRC
		endif
	endif
endif

" Plugins
" -----------------------------------------------------------------------------
call plug#begin()
Plug 'airblade/vim-gitgutter'			" Shows staged lines.
Plug 'lilydjwg/colorizer'				" Hex code colorizer.
Plug 'majutsushi/tagbar'				" Shows all methods and variables.
Plug 'mboughaba/i3config.vim'			" i3 syntax highlighting support.
Plug 'thaerkh/vim-workspace'			" Save workspace.
Plug 'tpope/vim-commentary'				" Commenting plugin.
Plug 'tpope/vim-fugitive'				" Git commands from ex mode.
Plug 'tpope/vim-repeat'					" Repeat support for plugins.
Plug 'tpope/vim-sleuth'					" Heuristic tabsizes.
Plug 'tpope/vim-surround'				" Surround movement command.
Plug 'tpope/vim-vinegar'				" Netrw oil.
Plug 'vim-airline/vim-airline'			" Status bar.
Plug 'vim-airline/vim-airline-themes'	" Themes for status bar.
Plug 'vim-scripts/SearchComplete'		" Tab completion inside of '/' search.
Plug 'wellle/context.vim'				" Context plugin.
Plug 'sickill/vim-monokai'				" A theme used when all else fails.
Plug 'machakann/vim-highlightedyank'	" Highlight yanked objects.
Plug 'rhysd/git-messenger.vim'			" Show git log messages.
Plug 'osyo-manga/vim-brightest'			" Highlight all instances of cwords.
Plug 'stefandtw/quickfix-reflector.vim' " Make the quickfix menu editable.
Plug 'psliwka/vim-smoothie'				" Smooth scrolling.
Plug 'airblade/vim-rooter'				" Sets working directory based.
Plug 'stsewd/fzf-checkout.vim'			" Add git actions to fzf.
Plug 'w0rp/ale'							" Linter used for csharp
Plug 'OmniSharp/omnisharp-vim'			" Csharp completion
Plug 'nvim-treesitter/nvim-treesitter'

" Plugins Requiring Host Packages
" -----------------------------------------------------------------------------
if executable('wal')
	Plug 'dylanaraps/wal.vim'			" Wal color setting.
endif

if executable('fzf') && executable('rg')
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'antoinemadec/coc-fzf'
else
	Plug 'kien/ctrlp.vim'
endif

" Change linters and completion for vim and neovim.
" -----------------------------------------------------------------------------
if has('nvim')
	if executable('node')
		Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Completion using lsp
	else
		Plug 'Shougo/deoplete.nvim',	{'do': ':UpdateRemotePlugins'}	" Completion using linters.
	endif
	if executable('firefox') || executable('chrome') || executable('chromium')
		Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
	endif
else
	" Completion using linters under default vim.
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
	Plug 'ervandew/supertab'
endif

Plug 'ayu-theme/ayu-vim',			{'as': 'ayu'}									" An interesting theme.
Plug 'challenger-deep-theme/vim',	{'as': 'challenger-deep'}						" An interesting theme.
Plug 'cohama/agit.vim',				{'on':['Agit']}									" Git log viewer.
Plug 'junegunn/goyo.vim',			{'on':['Goyo']}									" Distraction free writing.
Plug 'mbbill/undotree',				{'on':['UndotreeToggle']}						" Create an undotree.
Plug 'roman/golden-ratio',			{'on':['GoldenRatioToggle']}					" Change split sizes on focus change. This used to be a trigged plugin.
Plug 'scrooloose/nerdtree',			{'on':['NERDTreeToggle', 'NERDTreeFind']}		" Its NerdTree...but only when its toggled.
Plug 'Xuyuanp/nerdtree-git-plugin',	{'on':['NERDTreeToggle', 'NERDTreeFind']}		" Git plugin for NerdTree.
Plug 'ryanoasis/vim-devicons',		{'on':['NERDTreeToggle', 'NERDTreeFind']}		" Filetype icons for NerdTree.
" Javascript docs snippet.
Plug 'heavenshell/vim-jsdoc',		{'for':['javascript','javascript.jsx','typescript'],'do': 'make install'}
call plug#end()

" =============================================================================
" GENERAL CONFIGURATION
" =============================================================================

" General Configuration
filetype plugin indent on		" Syntax for different file types. Plus auto indent for that file type.
set fileformats=unix,dos,mac
set path+=**					" appends $PATH to find command
syntax on						" Syntax on bitch.
set wildmenu					" Allows us to use the wild card file menu
set background=dark				" Use text colors that look good on a dark background.
set autoindent					" Auto intent to the same col when on new line.
set smarttab					" Auto insert tabs spaces for curly braces.
set ruler						" Enables cursor location.
set wrap lbr					" Wrap on words.
set showmode					" Shows what mode you're in.
set showcmd						" Show partial command in status line.
set showmatch					" Show matching brackets.
set splitright					" Open new horizontal splits right of the current one.
set splitbelow					" Open new vertical splits below the current one.
set completeopt=longest,menuone,preview	" Better autocompletion.
set shortmess+=c				" Don't send short messages to |ins-completion-menu|
set hidden						" Buffers become hidden when abandoned.
set autoread					" Reload the file when it changes outside of (n)vim.
set visualbell					" Use visual bell instead of beeping.
set history=1000				" Increase history.
set undolevels=1000				" Increase undo levels.
set scrolloff=10				" Sets the scroll off set.
set confirm						" Prompt conformation dialogs
set tags=tags;					" Sets tag file to recursively up directory hierarchy. (The `;` is VERY important)
set noexpandtab					" Ensures that we use tabs and not spaces.
set noerrorbells				" No error bells.
set novisualbell				" No visual bell.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set updatetime=50				" set update time to 50ms (default: 4s)
let &showbreak='>> '			" show characters at the begining of wrapped lines.
set matchpairs+=<:>				" add '<' and '>' to pairs
set signcolumn=yes				" always show sign column (helps with coc and git gutter.)

if has('unnamedplus')
	set clipboard=unnamed,unnamedplus		" Allow us to paste to the system clipboard by default.
endif

if has('mouse')
	set mouse=a					" Enables mouse.
endif

if has('nvim')
	set winblend=10				" Enable transparency for floating windows like fzf.
	set inccommand=nosplit
else
	set nocompatible			" Disables legacy stuff. (for vim)
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,*.java

" Folding
" -----------------------------------------------------------------------------
set foldmethod=marker			" Sets manual foldmarkers.
highlight Folded ctermbg=black ctermfg=blue

" Search
" -----------------------------------------------------------------------------
set hlsearch				" While searching, highlight (and search) as you type.
set incsearch				" While searching, take you directly to where the so far typed pattern matches.
set ignorecase				" While searching, ignore case.
set smartcase				" While searching, use capitals when you use capitals.
set showmatch				" While search, show exact matches.

if executable('rg') && executable('fzf')
	let g:rg_derive_root='true'
	set grepprg=rg\ --vimgrep\ --smart-case\ --follow\ --color=always

	let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --smart-case --color=always --glob "!{.git/*,node_modules/*}"'

	let $FZF_DEFAULT_OPTS = " --ansi"
				\ . " --layout reverse"
				\ . " --margin=1,1"
				\ . " --prompt='∼ '"
				\ . " --pointer='▶'"
				\ . " --marker='✓'"
				\ . " --bind 'ctrl-a:select-all'"
				\ . " --bind 'ctrl-d:deselect-all'"
				\ . " --color=dark"
				\ . " --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1"
				\ . " --color=info:0,pointer:12,marker:4,spinner:11,header:-1"
				\ . " --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"

	let g:fzf_preview_window='right:65%'
	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
	let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
	let g:fzf_tags_command = 'ctags -R --fields=+iaS --extras=+q --exclude=.git'
	let g:fzf_branch_actions = {
				\  'track': {
				\    'prompt': 'Track> ',
				\    'execute': 'echo system("{git} checkout --track {branch}")',
				\    'multiple': v:false,
				\    'keymap': 'ctrl-t',
				\    'required': ['branch'],
				\    'confirm': v:false,
				\  },
				\  'merge':{
				\    'prompt': 'Merge> ',
				\    'execute': 'echo system("{git} merge {branch}")',
				\    'multiple': v:false,
				\    'keymap': 'ctrl-m',
				\    'required': ['branch'],
				\    'confirm': v:true,
				\  },
				\ }

	" By default coc_fzf tries to look like coc-preview. Make it look like our fzf
	let g:coc_fzf_preview = ''
	let g:coc_fzf_opts = []

	" nnoremap <leader>gl :Commits<CR>
	nnoremap <Space>gb :GBranches<CR>
	nnoremap <leader>bl :BCommits<CR>
	nnoremap \ :Rg<CR>
	nnoremap <C-p> :GFiles<CR>
	nnoremap <Space>pw :Rg <C-R>=expand("<cword>")<CR><CR>
else
	nnoremap \ :vimgrep<CR>
	nnoremap <Space>pw :vimgrep! <cword> * <CR>:copen<CR>
endif

nnoremap <Space>cs :CocSearch <C-R>=expand("<cword>")<CR><CR>

" Line Numbers
" -----------------------------------------------------------------------------
set relativenumber			" Enable relative number position when using 'set number'
set number					" Enable line numbering.

" No line numbers in terminal window on nvim
if has('nvim')
	autocmd TermOpen * setlocal listchars= nonumber norelativenumber
	autocmd TermOpen * startinsert
	autocmd BufEnter,BufWinEnter,WinEnter term://* startinsert
	autocmd BufLeave term://* stopinsert
endif

" Backups
" -----------------------------------------------------------------------------
set nobackup				" Disable backups.
set noswapfile				" Disable swap files.

" Persistent Undo
" -----------------------------------------------------------------------------
" Use persistent history.
if $CONTAINER !=? "true"
	if !isdirectory("/tmp/.vim-undo-dir")
		call mkdir("/tmp/.vim-undo-dir", "", 0700)
	endif
	set undodir=/tmp/.vim-undo-dir
	set undofile
endif

" Color Schemes
" -----------------------------------------------------------------------------
" This will manage color scheme stuff since we don't know if the host has wal
" installed.
" colorscheme challenger_deep
let ayucolor="dark"
colorscheme ayu
set termguicolors
" if executable('/usr/bin/wal') && !empty($DISPLAY)
" 	" Wal is installed and we are not on tty or ssh.
" 	let g:airline_theme = 'wal'
" 	colorscheme wal
" elseif !empty($DISPLAY) || ($CONTAINER ==? "true")
" 	" Wal is not installed and we are not on tty or ssh.
" 	colorscheme challenger_deep
" 	set termguicolors
" else
" 	" We are tty or ssh.
" 	colorscheme monokai
" endif

" =============================================================================
" Filetype Config
" =============================================================================
autocmd FileType ruby setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab
autocmd FileType typescript setlocal ts=2 sts=2 sw=2 noexpandtab

" Javascript
" =============================================================================

" Jsdoc
" -----------------------------------------------------------------------------
nnoremap <silent><leader>jd <Plug>(jsdoc)

" CSharp
" -----------------------------------------------------------------------------
"let g:OmniSharp_server_path = '/home/me/omnisharp/omnisharp.http-linux-x64/run'
let g:OmniSharp_server_stdio = 0
let g:OmniSharp_server_use_mono = 1
let g:ale_linters = {'cs':['OmniSharp']}

if executable('fzf') && executable('rg')
	let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim
else
	let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim
endif

augroup omnisharp_commands
	autocmd!

	" Show type information automatically when the cursor stops moving.
	" Note that the type is echoed to the Vim command line, and will overwrite
	" any other messages in this space including e.g. ALE linting messages.
	autocmd CursorHold *.cs OmniSharpTypeLookup

	autocmd FileType cs nmap <silent> <buffer> <leader>gd <Plug>(omnisharp_go_to_definition)
	autocmd FileType cs nmap <silent> <buffer> <leader>gt <Plug>(omnisharp_type_lookup)
	autocmd FileType cs nmap <silent> <buffer> <leader>gi <Plug>(omnisharp_find_implementations)
	autocmd FileType cs nmap <silent> <buffer> <leader>gc <Plug>(omnisharp_find_usages)
	autocmd FileType cs nmap <silent> <buffer> <leader>rr <Plug>(omnisharp_rename)
	autocmd FileType cs nmap <silent> <buffer> <leader>cr <Plug>(omnisharp_restart_server)

	autocmd FileType cs nmap <silent> <buffer> <leader>ospd <Plug>(omnisharp_preview_definition)
	autocmd FileType cs nmap <silent> <buffer> <leader>ospi <Plug>(omnisharp_preview_implementations)
	autocmd FileType cs nmap <silent> <buffer> <leader>osd <Plug>(omnisharp_documentation)
	autocmd FileType cs nmap <silent> <buffer> <leader>osfs <Plug>(omnisharp_find_symbol)
	autocmd FileType cs nmap <silent> <buffer> <leader>osfx <Plug>(omnisharp_fix_usings)
	autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
	autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

	autocmd FileType cs nmap <silent> <buffer> <leader>. <Plug>(omnisharp_code_action_repeat)
	autocmd FileType cs xmap <silent> <buffer> <leader>. <Plug>(omnisharp_code_action_repeat)
	autocmd FileType cs nmap <silent> <buffer> <leader>= <Plug>(omnisharp_code_format)

	" Navigate up and down by method/property/field
	autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
	autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
	" Find all code errors/warnings for the current solution and populate the quickfix window
	autocmd FileType cs nmap <silent> <buffer> <leader>osgcc <Plug>(omnisharp_global_code_check)
	" Contextual code actions (uses fzf, CtrlP or unite.vim selector when available)
	autocmd FileType cs nmap <silent> <buffer> <leader>osca <Plug>(omnisharp_code_actions)
	autocmd FileType cs xmap <silent> <buffer> <leader>osca <Plug>(omnisharp_code_actions)
	" Repeat the last code action performed (does not use a selector)

	autocmd FileType cs nmap <silent> <buffer> <leader>osst <Plug>(omnisharp_start_server)
	autocmd FileType cs nmap <silent> <buffer> <leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" Enable snippet completion, using the ultisnips plugin
" let g:OmniSharp_want_snippet=1


" Netrw Config
" -----------------------------------------------------------------------------
" let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


" =============================================================================
" CUSTOM KEY BINDS
" =============================================================================

" Leader Defined
" -----------------------------------------------------------------------------
let mapleader = " "

" Remap semicolon
" -----------------------------------------------------------------------------
" nnoremap ; :
" xnoremap ; :
" xnoremap : ;

" Map jj to escape.
inoremap jj <Esc>
" X escapes visual mode
" xnoremap x <Esc>
" vv selects til end of line (not incl newline)
vnoremap v $h
" Y in visual mode copies to selection clipboard
vnoremap Y "*y
" Y behave more like C and D
nnoremap Y y$

" Clear Search Highlights
" -----------------------------------------------------------------------------
nnoremap <leader>nh :noh<CR>

" Fold Binds
" -----------------------------------------------------------------------------
nnoremap <leader>ft za
" Create classic fold.
nnoremap <leader>fo :fold<CR>
" Create unnumbered fold.
nnoremap <leader>fc :fold<CR>4li<CR><ESC>ka<SPACE><SPACE><ESC>i
" Create numbered fold.
nnoremap <leader>fn :fold<CR>4li<++><CR><ESC>A<++><ESC><S-o><BS><++><ESC>k2hi<SPACE><SPACE><ESC>i

" Change movement behavior for wrapped lines.
" -----------------------------------------------------------------------------
noremap <buffer> <silent> k gk
noremap <buffer> <silent> j gj
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$

" Change movement behavior for wrapped lines in operator-pending mode(ex:d6j)
" -----------------------------------------------------------------------------
onoremap <silent> j gj
onoremap <silent> k gk

" Key maps for custom functions.
" -----------------------------------------------------------------------------
nnoremap <leader>so :Source<CR>
nnoremap <leader>st :SourceThis<CR>
nnoremap <silent><leader>fc :Flash<CR>
nnoremap <silent><leader>sc :ToggleSpell<CR>
nnoremap <silent><leader>bg :ToggleBG<CR>
nnoremap <silent><leader>su :Sudo<CR>
nnoremap <silent><leader>ev :e $MYVIMRC<CR>
nnoremap <silent><leader>sf :SpellFix<CR>
nnoremap <silent><leader>sl :UserColorColumn<CR>
nnoremap <silent><leader>sw :UserVisibleWhitespace<CR>

" Only create these binds if in neovim.
if has('nvim')
	nnoremap <leader>ts :TermSplit<CR>
	nnoremap <leader>tt :TermTab<CR>
	nnoremap <leader>hs :HtopVsplit<CR>
	nnoremap <leader>ht :HtopTab<CR>
	nnoremap <leader>tc :TTYClock<CR>
	nnoremap <leader>\ :TermWindow<CR>
endif

" Marker Replace
" -----------------------------------------------------------------------------
nnoremap <leader>mr /<++><CR>"_d4l:noh<CR>a

" Split movement.
" -----------------------------------------------------------------------------
" This maps keys to move between splits easier.
nnoremap <silent> <leader>= :vertical resize +10<CR>
nnoremap <silent> <leader>- :vertical resize -10<CR>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
" map <C-o> <C-W>o
" map <C-c> <C-W>c

" -----------------------------------------------------------------------------
" When visually selecting a block and changing the indentation, don't unselect.
vnoremap < <gv
vnoremap > >gv

" Buffer binds
" -----------------------------------------------------------------------------
nnoremap <leader>ls :ls<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
if executable('fzf') && executable('rg')
	nnoremap <leader>bl :Buffers<CR>
else
	nnoremap <leader>bl :buffers<CR>
endif

" Reformatting Binds
" -----------------------------------------------------------------------------
nnoremap <leader>rf gg=G``							" Format the whole file
nnoremap <leader>ra gggqgG''						" Include list

" Moving binds
" -----------------------------------------------------------------------------
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" Quickfix list binds
" -----------------------------------------------------------------------------
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>qp :cprevious<CR>

" Ctags Setup
" -----------------------------------------------------------------------------
" ^] to jump to tag under cursor
" g^] for ambiguous tags
" ^t to jump back to the tag stack

" Gates functionality predicated on ctags being installed in path.
if executable('ctags')
	command! MakeTags !ctags -R --fields=+iaS --extras=+q --exclude=.git,node_modules .
endif

" =============================================================================
" PLUGIN CONFIGURATION
" =============================================================================

" COC
" -----------------------------------------------------------------------------
if has('nvim')

	let g:coc_global_extensions = [
		\ 'coc-clock',
		\ 'coc-css',
		\ 'coc-docker',
		\ 'coc-eslint',
		\ 'coc-github',
		\ 'coc-html',
		\ 'coc-import-cost',
		\ 'coc-json',
		\ 'coc-markdownlint',
		\ 'coc-marketplace',
		\ 'coc-phpls',
		\ 'coc-prettier',
		\ 'coc-python',
		\ 'coc-sh',
		\ 'coc-sql',
		\ 'coc-tag',
		\ 'coc-tsserver',
		\ 'coc-vimlsp',
		\ 'coc-xml',
		\ 'coc-yaml'
		\ ]

	if executable('discord')
		call coc#add_extension('coc-discord-neovim')
	endif

	if executable('javac')
		call coc#add_extension('coc-java')
	endif

	if executable('clang')
		call coc#add_extension('coc-clangd')
	endif

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	inoremap <silent><expr> <C-space> coc#refresh()

	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction

	" Go to code navigation.
	nmap <leader>gd <Plug>(coc-definition)
	nmap <leader>gt <Plug>(coc-type-definition)
	nmap <leader>gi <Plug>(coc-implementation)
	nmap <leader>gc <Plug>(coc-references)
	nmap <leader>rr <Plug>(coc-rename)
	nmap <leader>g[ <Plug>(coc-diagnostic-prev)
	nmap <leader>g] <Plug>(coc-diagnostic-next)
	nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
	nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
	nnoremap <leader>cr :CocRestart<CR><CR>

	function! ShowDocIfNoDiagnostic(timer_id)
		if (coc#float#has_float() == 0)
			silent call CocActionAsync('doHover')
		endif
	endfunction

	function! s:show_hover_doc()
		call timer_start(500, 'ShowDocIfNoDiagnostic')
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	" autocmd CursorHold * silent call CocActionAsync('highlight')
	" Show documentation of stuff on hover.
	autocmd CursorHoldI * :call <SID>show_hover_doc()
	autocmd CursorHold * :call <SID>show_hover_doc()

	command! -nargs=0 Prettier :CocCommand prettier.formatFile
	vnoremap <leader>fs  <Plug>(coc-format-selected)
	nnoremap <leader>fs  <Plug>(coc-format-selected)

	let g:airline#extensions#coc#enabled = 1
endif

" SuperTab Completer
" -----------------------------------------------------------------------------
" This is only used with deoplete when we don't have coc installed.
if !has('nvim')
	let g:SuperTabDefaultCompletionType = "<c-n>"
endif

" FireNvim
" -----------------------------------------------------------------------------
if has('nvim')
	if exists('g:started_by_firenvim')
		set statusline=0
		normal! :AirlineToggle
		let w:airline_disable_statusline = 1
		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#show_buffers = 0
		let g:airline#extensions#tabline#show_tabs = 1
		normal! :ContextDisable
		set spell
		colorscheme challenger_deep
		set termguicolors
	endif

	function! s:IsFirenvimActive(event) abort
		if !exists('*nvim_get_chan_info')
			return 0
		endif
		let l:ui = nvim_get_chan_info(a:event.chan)
		return has_key(l:ui, 'client') && has_key(l:ui.client, 'name') &&
					\ l:ui.client.name =~? 'Firenvim'
	endfunction

	function! OnUIEnter(event) abort
		if s:IsFirenvimActive(a:event)
			set laststatus=0
			normal! :AirlineToggle
			colorscheme challenger_deep
			set termguicolors
		endif
	endfunction
	autocmd UIEnter * call OnUIEnter(deepcopy(v:event))

	" FireNvim site<->filetype overrides.
	autocmd BufEnter github.com_*.txt set filetype=markdown
endif

" NERDTree config
" -----------------------------------------------------------------------------
" Open NERDTree bind
nnoremap <silent><leader>nt	:NERDTreeToggle<CR>
nnoremap <silent><leader>nf :NERDTreeFind<CR>
let NERDTreeMouseMode = 3
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw = 1
" let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeCascadeOpenSingleChildDir = 0

" Devicons
" -----------------------------------------------------------------------------
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_airline_tabline = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" FuGITive
" -----------------------------------------------------------------------------
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>

" GitGutter Config
" -----------------------------------------------------------------------------
let g:gitgutter_enabled = 1		" enable gitgutter

" Git Messanger
" -----------------------------------------------------------------------------
nnoremap <silent><leader>gm :GitMessenger

" Neovim Terminal Mode Config
" -----------------------------------------------------------------------------
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	autocmd TermOpen * setlocal statusline=%{b:term_title}
endif

" Airline Config
" -----------------------------------------------------------------------------
" This is all of the Airline configs.
" This next line is set in the Color Schemes section.
" let g:airline_theme='wal'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ' | '
let g:airline_powerline_fonts = 1

" AirLine (unicode) symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
else
	let g:airline_left_sep = '»'
	let g:airline_right_sep = '«'
	let g:airline_symbols.crypt = '🔒'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.maxlinenr = '☰'
	let g:airline_symbols.maxlinenr = ''
	let g:airline_symbols.branch = '@'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.spell = 'Ꞩ'
	let g:airline_symbols.whitespace = 'Ξ'
endif

" CSS Color Settings
" -----------------------------------------------------------------------------
" ColorToggle
nnoremap <leader>ct	:ColorToggle<CR>
" Stop jacking my binds.
let g:colorizer_nomap = 1
" General settings
let g:colorizer_auto_color = 1
let g:colorizer_x11_name = 1
let g:colorizer_maxlines = 500

" Vim-Highlightedyank
" -----------------------------------------------------------------------------
" Bind y to activate plugin.
map y <Plug>(highlightedyank)
" Highlight time in milliseconds. '-1' makes in infinite.
let g:highlightedyank_highlight_duration = 50

" Aget
" -----------------------------------------------------------------------------
nnoremap <silent><leader>ag	:Agit<CR>

" UndoTree
" -----------------------------------------------------------------------------
nnoremap <silent><leader>ut :UndotreeToggle<CR>

" NERDCommenter
" -----------------------------------------------------------------------------
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1
let NERDTrimTraillingWhitespace = 1

" Deoplete
" -----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
"let g:deoplete#complete_method = 'omnifunc'

" Golden-ratio
" -----------------------------------------------------------------------------
nnoremap <leader>gr	:GoldenRatioToggle<CR>

" Goyo (distraction free writing)
" -----------------------------------------------------------------------------
" TODO: make a meaningful bind
nnoremap <leader>gy :Goyo<cr>

" CtrlP
" -----------------------------------------------------------------------------
if !executable('fzf')
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlP'
	" Ignore .git directory.
	let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']
	" Start search from start of directory containing .git folder.
	" More options here: https://github.com/ctrlpvim/ctrlp.vim
	let g:ctrlp_working_path_mode='ra'
endif

" Tag Bar
" -----------------------------------------------------------------------------
" This is all the config for tag bar.
nnoremap <silent><leader>tb :TagbarToggle<CR>

" VimBrightest
" -----------------------------------------------------------------------------
let g:brightest#highlight = {
	\ "group" : "BrightestUndercurl"
	\ }

" Vim-Rooter
" -----------------------------------------------------------------------------
" Change cwd.
" cd =  +current buffer, -current window, -other windows, -current tab, -other tabs
" tcd = +current buffer, +current window, -other windows, +current tab, -other tabs
" lcd = +current buffer, +current window, -other windows, -current tab, -other tabs
let g:rooter_cd_cmd = 'tcd'
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = [
	\ '.git',
	\ 'package.json',
	\ '=src',
	\ '*.sln',
	\ 'Makefile'
	\ ]

" Tree Sitter
" -----------------------------------------------------------------------------
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
}
EOF

" =============================================================================
" CUSTOM FUNCTIONS
" =============================================================================

" Change Keyboard Brightness on mode B)
" -----------------------------------------------------------------------------
" Only do this if on a chromebook.
if !empty(glob('/sys/class/leds/chromeos::kbd_backlight/brightness'))
	autocmd InsertEnter * silent! call system('echo 50 > /sys/class/leds/chromeos::kbd_backlight/brightness')
	autocmd InsertLeave * silent! call system('echo 1 > /sys/class/leds/chromeos::kbd_backlight/brightness')
endif

" Only create these functions if we are in neovim.
if has('nvim')

	" TTYClock()
" -----------------------------------------------------------------------------
	" This executes ttyclock in a new full screen tab.
	" Requires the host to have tty-clock installed.
	if executable('tty-clock')
		function! TTYClock()
			exec "tabnew term://tty-clock -C 6 -txbsrc"
		endfunction
		command! TTYClock silent! call TTYClock()
	endif

	" Cmatrix()
" -----------------------------------------------------------------------------
	" This executes cmatrix in a new full screen tab.
	" Requires the host to have cmatrix installed.
	if executable('cmatrix')
		function! Cmatrix()
			exec "tabnew term://cmatrix -a -C cyan"
		endfunction
		command! Cmatrix silent! call Cmatrix()
	endif

	" Htop()
" -----------------------------------------------------------------------------
	" This executes htop in a new full screen tab.
	" Requires the host to have htop installed.
	if executable('htop')
		function! Htop(window)
			if system('if [ -e /usr/bin/htop ]; then echo true; fi') =~ "true"
				if a:window ==? "tabnew"
					exec "tabnew term://htop"
				elseif a:window ==? "vsplit"
					exec "vsplit term://htop"
					" exec "normal! \<C-w>r\<C-w>\<C-w>"
				else
					echom "Bad command!"
				endif
			else
				echom "Htop is NOT installed on the host system!"
			endif
		endfunction
		command! HtopTab silent! call Htop("tabnew")
		command! HtopVsplit silent! call Htop("vsplit")
	endif

	" Terminal Split
" -----------------------------------------------------------------------------
	" Make a terminal and split it on the right side.
	function! TermSplit()
		exec "vsplit term://zsh"
		exec "terminal!"
	endfunction
	command TermSplit silent! call TermSplit()

	" Terminal Tab
" -----------------------------------------------------------------------------
	" Make a terminal in a new tab.
	function! TermTab()
		exec "tabnew term://zsh"
		exec "terminal!"
	endfunction
	command TermTab silent! call TermTab()

	" Terminal Window
" -----------------------------------------------------------------------------
	" Make a floating terminal window as a scratch pad.
	function! OpenFloatingWin()
		let startX = float2nr(&lines / 20)
		let startY = float2nr(&columns / 20)
		let height = float2nr(startX * 23)
		let width = float2nr(startY * 19)

		"Set the position, size, etc. of the floating window.
		"The size configuration here may not be so flexible, and there's room for further improvement.
		let opts = {
					\ 'relative': 'editor',
					\ 'row': startX,
					\ 'col': startY,
					\ 'width': width,
					\ 'height': height
					\ }

		let buf = nvim_create_buf(v:false, v:true)
		let win = nvim_open_win(buf, v:true, opts)

		"Set Floating Window Highlighting
		call setwinvar(win, '&winhl', 'Terminal:Pmenu')

		setlocal
					\ buftype=nofile
					\ nobuflisted
					\ bufhidden=hide
					\ nonumber
					\ norelativenumber
					\ signcolumn=no

		exec "terminal!"

	endfunction
	command TermWindow silent! call OpenFloatingWin()

endif

" Speed Profiling
" -----------------------------------------------------------------------------
" Lets you see what plugins/external commands are slowing down vim.
function! ProfileStart() "
	exec "profile start profile.log"
	exec "profile func *"
	exec "profile file *"
	echo "Do the actions you want profiled, then call :ProfileEnd"
endfunction
command ProfileStart silent! call ProfileStart()

function! ProfileEnd() "
	exec "profile pause"
	exec "noautocmd qall!"
endfunction
command ProfileEnd silent! call ProfileEnd()

" Crosshair Flash()
" -----------------------------------------------------------------------------
" This will flash cols and rows to locate the cursor
function! Flash()
	set cursorline cursorcolumn
	redraw
	sleep 200m
	set nocursorline nocursorcolumn
endfunction
command Flash silent! call Flash()

" ToggleSpell()
" -----------------------------------------------------------------------------
" This will toggle spell check.
function! ToggleSpell()
	if &spell
		set nospell
		echom "Spell Check OFF"
	else
		set spell
		echom "Spell Check ON"
	endif
endfunction
command ToggleSpell silent! call ToggleSpell()

" SpellFix()
" -----------------------------------------------------------------------------
function! SpellFix()
	normal! mp[s1z=`p
endfunction
command SpellFix silent! call SpellFix()

" ToggleBG()
" -----------------------------------------------------------------------------
" Toggle background between light dark
" This can be rewritten like this:
" nnomap <leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
function! ToggleBG()
	if &background ==? "dark"
		set background=light
	else
		set background=dark
	endif
endfunction
command ToggleBG silent! call ToggleBG()

" Source()
" -----------------------------------------------------------------------------
" Sources the vimrc file dynamically.
function! Source()
	exec "source $MYVIMRC"
	sleep 100m
	exec "AirlineRefresh"
endfunction
command Source silent! call Source()

" SourceThis()
" -----------------------------------------------------------------------------
" Sources the vimrc file dynamically.
function! SourceThis()
	exec "source %"
	sleep 100m
	exec "AirlineRefresh"
endfunction
command SourceThis silent! call SourceThis()

" Sudo() - Reopen a file with sudo permission
" -----------------------------------------------------------------------------
function! Sudo()
	exec "w !sudo tee %"
endfunction
command Sudo silent! call Sudo()

" Configure Color Column
" -----------------------------------------------------------------------------
let g:UserColorColumnBool=0
function! UserColorColumn()
	if g:UserColorColumnBool==1
		let &colorcolumn=0
		let g:UserColorColumnBool=0
	else
		let &colorcolumn=join(range(81,81),",")				" Set bar at column 81
		let &colorcolumn="80,".join(range(121,121),",")		" Set bar at column121
		let g:UserColorColumnBool=1
	endif
endfunction
command UserColorColumn silent call UserColorColumn()
" call UserColorColumn() " Uncomment to turn on by default.

" Make that line black w/ a bit of blue.
highlight ColorColumn ctermbg=235 guibg=#003333

" Configure Visible Whitespace
" -----------------------------------------------------------------------------
let g:UserVisibleWhitespace=0
function! UserVisibleWhitespace()
	if &list
		set nolist
		echom "Visble Whitespace OFF"
	else
		set list
		echom "Visble Whitespace ON"
	endif
endfunction
command UserVisibleWhitespace silent call UserVisibleWhitespace()
" call UserVisibleWhitespace() " Ucomment to turn on by default.

set listchars=tab:·\ ,extends:›,precedes:‹,nbsp:·,trail:·
highlight Whitespace ctermfg=8 guifg=DarkGray

" Auto-Resize
" -----------------------------------------------------------------------------
autocmd VimResized * execute "normal! \<C-w>="

" Netrw
" -----------------------------------------------------------------------------
function! ToggleNetrw()
	let i = bufnr("$")
	let wasOpen = 0
	while (i >= 1)
		if (getbufvar(i, "&filetype") == "netrw")
			silent exe "bwipeout " . i
			let wasOpen = 1
		endif
		let i-=1
	endwhile
	if !wasOpen
		silent Lexplore
	endif
endfunction
map <F3> :call ToggleNetrw() <CR>

" Fix TrailingWhitespace
" -----------------------------------------------------------------------------
fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" Open help in vertical split
" -----------------------------------------------------------------------------
augroup vimrc_help
	autocmd!
	autocmd FileType help
		\  wincmd L
		\| setlocal nonumber
		\| vertical resize 82
augroup END

" vim:tw=78:ts=4:fdm=marker

" Prevent security issues.
set secure
set exrc

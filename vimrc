 " ██████╗ ██╗	 ██╗██████╗ ██████╗  █████╗ ███████╗
 " ██╔══██╗██║	 ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝
 " ██████╔╝██║	 ██║██████╔╝██████╔╝███████║███████╗
 " ██╔══██╗██║	 ██║██╔══██╗██╔══██╗██╔══██║╚════██║
 " ██████╔╝╚██████╔╝██████╔╝██████╔╝██║  ██║███████║
 " ╚═════╝	╚═════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

 "	██╗███╗   ██╗██╗ ██╗   ██╗██╗███╗	███╗██████╗  ██████╗
 " ██╔╝████╗  ██║╚██╗██║   ██║██║████╗ ████║██╔══██╗██╔════╝
 " ██║ ██╔██╗ ██║ ██║██║   ██║██║██╔████╔██║██████╔╝██║
 " ██║ ██║╚██╗██║ ██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
 " ╚██╗██║ ╚████║██╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
 "	╚═╝╚═╝	╚═══╝╚═╝   ╚═══╝  ╚═╝╚═╝	 ╚═╝╚═╝  ╚═╝ ╚═════╝

" =============================================================================
" PLUGINS
" =============================================================================

" Environmental Setup
" -----------------------------------------------------------------------------
" Set some sane environment values.
set encoding=utf-8
scriptencoding utf-8
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
		autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
	endif
else
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
			\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
	endif
endif

" Plugins
" -----------------------------------------------------------------------------
call plug#begin()
Plug 'Xuyuanp/nerdtree-git-plugin'		" Git plugin for NerdTree.
Plug 'airblade/vim-gitgutter'			" Shows staged lines.
Plug 'camspiers/animate.vim'			" Window animations.
Plug 'camspiers/lens.vim'				" Window animations.
Plug 'ctrlpvim/ctrlp.vim'				" ControlP (this could be triggerd but then the bind doesn't work) {'on':['CtrlP','CtrlPBuffer','CtrlPMRU','CtrlPMixed']}
Plug 'lilydjwg/colorizer'				" Hex code colorizer. This used to be a triggered plugin. {'on':['ColorToggle']}
Plug 'machakann/vim-highlightedyank'	" Highlight yanked objects.
Plug 'majutsushi/tagbar'				" Shows all methods and variables.
Plug 'matze/vim-move'					" Move text selections.
Plug 'mboughaba/i3config.vim'			" i3 syntax highlighting support.
Plug 'sheerun/vim-polyglot'				" Syntax highlighting for a lot of languages. (Striped down, install specific ones if needed.)
Plug 'thaerkh/vim-workspace'			" Save workspace.
Plug 'tomasr/molokai'					" color theme for when wal is not installed.
Plug 'tpope/vim-commentary'				" Commenting Plugin (Tring this instead of nerd commenter)
Plug 'tpope/vim-fugitive'				" Git commands from ex mode.
Plug 'tpope/vim-repeat'					" Repeat support for plugins.
Plug 'tpope/vim-sleuth'					" Heuristic tabsizes.
Plug 'tpope/vim-surround'				" Surround movement command.
Plug 'tpope/vim-vinegar'				" Netrw oil.
Plug 'vim-airline/vim-airline'			" Status bar.
Plug 'vim-airline/vim-airline-themes'	" Themes for status bar.
Plug 'vim-scripts/SearchComplete'		" Tab completion inside of '/' search.
Plug 'wellle/context.vim'				" Context plugin
Plug 'yuttie/comfortable-motion.vim'	" Smooth scrolling.
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Completion using lsp
" Plug 'ervandew/supertab'				" Tab completion.

" Plugins Requiring Host Packages
" -----------------------------------------------------------------------------
if executable('wal')
	Plug 'dylanaraps/wal.vim'			" Wal color setting.
endif

" Change linters and completion for vim and neovim.
" -----------------------------------------------------------------------------
if has('nvim')
	" Plug 'Shougo/deoplete.nvim',	{'do': ':UpdateRemotePlugins'}	" Omnicompletion for neovim Plug 'w0rp/ale'			" Linter.
else
	" Plug 'valloric/youcompleteme'		" Vim completion. May require `~/.vim/plugged/youcompleteme/install.py` on updates.
	Plug 'vim-syntastic/syntastic'	" Syntastic linter.
endif

" Triggered Plugins
Plug 'cohama/agit.vim',			{'on':['Agit']}					" Git log viewer.
Plug 'junegunn/goyo.vim',		{'on':['Goyo']}					" Distraction free writing.
Plug 'mbbill/undotree',			{'on':['UndotreeToggle']}		" Create an undotree.
Plug 'roman/golden-ratio',		{'on':['GoldenRatioToggle']}	" Change split sizes on focus change. This used to be a trigged plugin.
Plug 'scrooloose/nerdtree',		{'on':['NERDTreeToggle']}		" Its NerdTree...but only when its toggled.
call plug#end()

" =============================================================================

" GENERAL CONFIGURATION
" =============================================================================

" General Configuration
filetype plugin indent on		" Syntax for different file types. Plus auto indent for that file type.
set path+=**					" appends $PATH to find command
syntax on						" Syntax on bitch.
set wildmenu					" Allows us to use the wild card file menu
set background=dark				" Use text colors that look good on a dark background.
set autoindent					" Auto intent to the same col when on new line.
set smarttab					" Auto insert tabs spaces for curly braces.
set ruler						" Enables cursor location.
set wrap lbr					" Wrap on words.
set nocompatible				" Disables legacy stuff. (for vim)
set showmode					" Shows what mode you're in.
set showcmd						" Show partial command in status line.
set showmatch					" Show matching brackets.
set splitright					" Open new horizontal splits right of the current one.
set splitbelow					" Open new vertical splits below the current one.
set completeopt=longest,menuone,preview	" Better autocompletion.
set shortmess+=c				" Don't send short messages to |ins-completion-menu|
" set hidden					" Buffers become hidden when abandoned.
set autoread					" Reload the file when it changes outside of (n)vim.
set visualbell					" Use visual bell instead of beeping.
set history=1000				" Increase history.
set undolevels=1000				" Increase undo levels.
set scrolloff=5					" Sets the scroll off set.
set confirm						" Prompt conformation dialogs
set tags=tags;					" Sets tag file to recursively up directory hierarchy. (The `;` is VERY important)
set clipboard=unnamedplus		" Allow us to paste to the system clipboard by default.
set noexpandtab					" Ensures that we use tabs an not spaces.
set novisualbell				" No visual bell.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set updatetime=50				" set update time to 50ms (default: 4s)

if has('mouse')
	set mouse=a					" Enables mouse.
endif

if has('nvim')
	set inccommand=nosplit
endif

set list
set listchars=tab:·\ ,extends:›,precedes:‹,nbsp:·,trail:·
highlight Whitespace ctermfg=8 guifg=DarkGray


" Folding
" -----------------------------------------------------------------------------
set foldmethod=marker						" Sets manual foldmarkers.
highlight Folded ctermbg=black ctermfg=blue
"autocmd BufWinLeave *.* mkview				" Save folds on exit.
"autocmd BufWinEnter *.* silent loadview	" Create folds from save.

" Search
" -----------------------------------------------------------------------------
set hlsearch				" While searching, highlight (and search) as you type.
set incsearch				" While searching, take you directly to where the so far typed pattern matches.
set ignorecase				" While searching, ignore case.
set smartcase				" While searching, use capitals when you use capitals.
set showmatch				" While search, show exact matches.

if executable('rg')
	let g:rg_derive_root='true'
	set grepprg=rg\ --vimgrep
endif
nnoremap <silent> K :vimgrep! <cword> * <CR>:copen<CR>

" Line Numbers
" -----------------------------------------------------------------------------
set relativenumber			" Enable relative number position when using 'set number'
set number					" Enable line numbering.

" Backups
" -----------------------------------------------------------------------------
set nobackup				" Disable backups.
set noswapfile				" Disable swap files.

" Persistent Undo
" -----------------------------------------------------------------------------
" " Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
	call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile

" Color Schemes
" -----------------------------------------------------------------------------
" This will manage color scheme stuff since we don't know if the host has wal
" installed.
if executable('/usr/bin/wal')
	let g:airline_theme = 'wal'
	colorscheme wal
else
	let g:airline_theme = 'molokai'
	colorscheme molokai
endif

" Netrw Config
" -----------------------------------------------------------------------------
" let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25


" =============================================================================
" LANGUAGE SPECIFIC SETTINGS
" From :h ft-$LANGUAGE
" =============================================================================

" HTML
" -----------------------------------------------------------------------------
" HTML skeleton file insertion
nnoremap <leader>wh :-1read $HOME/.vim/templates/html.skel<CR>

" =============================================================================
" CUSTOM KEY BINDS
" =============================================================================

" CONTROVERSY
" -----------------------------------------------------------------------------
nnoremap ; :

" Leader Defined
" -----------------------------------------------------------------------------
let mapleader = ","

" Clear Search Highlights
" -----------------------------------------------------------------------------
nnoremap <leader>nh :noh<CR>

" Fold Binds
" -----------------------------------------------------------------------------
nnoremap <Space> za
" Create classic fold.
nnoremap <leader>of :fold<CR>
" Create unnumbered fold.
nnoremap <leader>cf :fold<CR>4li<CR><ESC>ka<SPACE><SPACE><ESC>i
" Create numbered fold.
nnoremap <leader>nf :fold<CR>4li<++><CR><ESC>A<++><ESC><S-o><BS><++><ESC>k2hi<SPACE><SPACE><ESC>i

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
nnoremap <leader>fc :Flash<CR>
nnoremap <leader>sc :ToggleSpell<CR>
nnoremap <leader>bg :ToggleBG<CR>
nnoremap <leader>so :Source<CR>
nnoremap <leader>st :SourceThis<CR>
nnoremap <leader>su :Sudo<CR>
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sf :SpellFix<CR>
nnoremap <leader>us :UserColorColumn<CR>

" Only create these binds if in neovim.
if has('nvim')
	nnoremap <leader>ts :TermSplit<CR>
	nnoremap <leader>tt :TermTab<CR>
	nnoremap <leader>hs :HtopVsplit<CR>
	nnoremap <leader>ht :HtopTab<CR>
	nnoremap <leader>tc :TTYClock<CR>
endif

" Marker Replace
" -----------------------------------------------------------------------------
inoremap <leader>mr <ESC>/<++><CR>"_d4l:noh<CR>a
nnoremap <leader>mr /<++><CR>"_d4l:noh<CR>a

" Split movement.
" -----------------------------------------------------------------------------
" This maps keys to move between splits easier.
nnoremap <silent> <leader>= :call animate#window_delta_width(10)<CR>
nnoremap <silent> <leader>- :call animate#window_delta_width(-10)<CR>
" If animate plugin is ever removed, this is the same behavior.
" nnoremap <silent> <leader>= :vertical resize +10<CR>
" nnoremap <silent> <leader>- :vertical resize -10<CR>
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-L> <C-W>l

" -----------------------------------------------------------------------------
" When visually selecting a block and changing the indentation, don't unselect.
vnoremap < <gv
vnoremap > >gv

" Buffer Binds
" -----------------------------------------------------------------------------
" These binds are for changing buffers.
nnoremap <leader>ls :ls<CR>
inoremap <leader>bn <ESC>:bnext<CR>
inoremap <leader>bp <ESC>:bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bo :buffers<CR>:buffer<Space>		" Open buffer
nnoremap <leader>bd :buffers<CR>:bdelete<Space>		" Delete buffer<Paste>

" Reformatting Binds
" -----------------------------------------------------------------------------
nnoremap <leader>rf gg=G``							" Format the whole file
nnoremap <leader>ra gggqgG''						" Include list

" Ctags Setup
" -----------------------------------------------------------------------------
" ^] to jump to tag under cursor
" g^] for ambiguous tags
" ^t to jump back to the tag stack

" Gates functionality predicated on ctags being installed in path.
if executable('ctags')
	command! MakeTags !ctags -R --fields=+iaS --extra=+q --exclude=.git .
endif

" =============================================================================
" PLUGIN CONFIGURATION
" =============================================================================

" COC
" -----------------------------------------------------------------------------
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

" Go to code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gt <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gc <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart<CR><CR>

" NERDTree config
" -----------------------------------------------------------------------------
" Open NERDTree bind
nnoremap <leader>nt	:NERDTreeToggle<CR>
let NERDTreeMouseMode = 3
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw = 1
" let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeCascadeOpenSingleChildDir = 0

" FuGITive
" -----------------------------------------------------------------------------
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>

" GitGutter Config
" -----------------------------------------------------------------------------
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
let g:gitgutter_enabled = 1		" enable gitgutter

" SuperTab
" -----------------------------------------------------------------------------
"let g:SuperTabDefaultCompletionType = "<c-n>"

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

" Syntastic recommended settings.
" -----------------------------------------------------------------------------
" Global Settings:
if has('nvim')
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	" Disable the location list (it is annoying)
	let g:syntastic_auto_loc_list = 0
	" let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 1
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

" Smooth Scroll Settings
" -----------------------------------------------------------------------------
" Smooth Scroll the j and k keys.
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
"
" Intervals
let g:comfortable_motion_interval = 1000/60		" Default = 1000/60
let g:comfortable_motion_friction = 80.0		" Default = 80.0
let g:comfortable_motion_air_drag = 2.0			" Default = 2.0

" Vim-Highlightedyank
" -----------------------------------------------------------------------------
" Bind y to activate plugin.
map y <Plug>(highlightedyank)
" Highlight time in milliseconds. '-1' makes in infinite.
let g:highlightedyank_highlight_duration = 1000

" Aget
" -----------------------------------------------------------------------------
nnoremap <leader>ag	:Agit<CR>

" UndoTree
" -----------------------------------------------------------------------------
nnoremap <leader>ut :UndotreeToggle<CR>

" Vim-Session
" -----------------------------------------------------------------------------
" Save session
nnoremap <leader>ss	:ToggleWorkspace<CR>
" Save session default name
let g:workspace_session_name = '.saved_session.vim'

" Vim-move
" -----------------------------------------------------------------------------
let g:move_key_modifier = 'C'

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
" :h golden-ratio
" :GoldenRatioToggle
" :GoldenRatioResize

" Goyo (distraction free writing)
" -----------------------------------------------------------------------------
" TODO: make a meaningful bind
nnoremap <leader>gy :Goyo<cr>

" CtrlP
" -----------------------------------------------------------------------------
" Config for CtrlP.
" :h ctrlp@en
" Mapings for CtlP.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Ignore .git directory.
let g:ctrlp_user_command=['.git', 'cd %s && git ls-files -co --exclude-standard']
" Start search from start of directory containing .git folder.
" More options here: https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_working_path_mode='ra'

" Tag Bar
" -----------------------------------------------------------------------------
" This is all the config for tag bar.
nnoremap <leader>tb :TagbarToggle<CR>
inoremap <leader>tb <ESC>:TagbarToggle<CR>

" Ale
" -----------------------------------------------------------------------------
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Disable constant linting
" TODO: Make this specific to laptops by glob'ing battery
" let g:ale_lint_on_text_changed = 'never'

" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0

" Enable error list
let g:ale_open_list = 0

" Linter engines:
" PYTHON REQUIRES: flake8,mypy,pycodestyle,pylint installed!
" JavaScript REQUIRES: eslint
" HTML REQUIRES: htmlhint (requires node)
let g:ale_linters = {'python': ['flake8', 'mypy', 'pycodestyle', 'pylint'],
		\ 'javascript': ['eslint'],
		\ 'html': ['htmlhint']
		\ }

" Fixer engines:
" REQUIRES autopep8,isort,yapf installed!
let g:ale_fixers = {'python': ['autopep8', 'isort', 'yapf']}

" Lint on save enable (disable other linting times)
let g:ale_fix_on_save = 1

" " Change linting frequency. (default:always,never,insert,normal)
" let g:ale_lint_on_text_changed = never
" let g:ale_lint_on_text_changed = normal

" " Change linting to insertleave event. (default:1,0)
" let g:ale_lint_on_insert_leave = 1

" Lens and Animate
" -----------------------------------------------------------------------------
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
" let g:lens#disabled = 1
" let g:lens#animate = 0
" let g:lens#height_resize_max = 20
" let g:lens#height_resize_min = 5
" let g:lens#width_resize_max = 80
" let g:lens#width_resize_min = 20

" Lens and Animate
" -----------------------------------------------------------------------------
" let g:context_enabled = 1
" let g:context_filetype_blacklist = []
" let g:context_presenter = nvim-float/vim-popup
" let g:context_max_height = 21
" let g:context_max_per_indent = 5
" g:context_border_char = '▬'
" let g:context_highlight_normal = 'Normal'
" let g:context_highlight_border = 'Comment'
" let g:context_highlight_tag	 = 'Special'


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

" Only do this if on a samsung.
if !empty(glob('/sys/class/leds/samsung::kbd_backlight/brightness'))
	autocmd InsertEnter * silent! call system('echo 6 > /sys/class/leds/samsung::kbd_backlight/brightness')
	autocmd InsertLeave * silent! call system('echo 1 > /sys/class/leds/samsung::kbd_backlight/brightness')
endif

" Only create these functions if we are in neovim.
if has('nvim')

	" TTYClock()
" -----------------------------------------------------------------------------
	" This executes ttyclock in a new full screen tab.
	" Requires the host to have tty-clock installed.
	if executable('tty-clock')
		function! TTYClock()
			if system('if [ -e /usr/bin/tty-clock ]; then echo true; fi') =~ "true"
				let g:indentLine_enabled = 0
				exec "tabnew term://tty-clock -C 6 -txbsrc"
			else
				echom "TTYClock NOT installed on host system!"
			endif
		endfunction
		command! TTYClock silent! call TTYClock()
	endif

	" Cmatrix()
" -----------------------------------------------------------------------------
	" This executes cmatrix in a new full screen tab.
	" Requires the host to have cmatrix installed.
	if executable('cmatrix')
		function! Cmatrix()
			if system('if [ -e /usr/bin/cmatrix ]; then echo true; fi') =~ "true"
				let g:indentLine_enabled = 0
				exec "tabnew term://cmatrix -a -C cyan"
			else
				echom "Cmatrix NOT installed on host system!"
			endif
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
	" Just make a terminal and split it on the right side.
	function! TermSplit()
		let g:indentLine_enabled=0
		" TODO: change the next line to open in working directory"
		exec "vsplit term://zsh"
		exec "terminal!"
	endfunction
	command TermSplit silent! call TermSplit()

	" Terminal Tab
" -----------------------------------------------------------------------------
	" Just make a terminal in a new tab ffs.
	function! TermTab()
		exec "tabnew term://zsh"
		exec "terminal!"
	endfunction
	command TermTab silent! call TermTab()
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
call UserColorColumn()

" Make that line black w/ a bit of blue.
highlight ColorColumn ctermbg=235 guibg=#003333

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
" augroup vimrc_help
"   autocmd!
"   autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
" augroup END
" autocmd! FileType help :wincmd L | :vert resize 90

augroup BgHighlight
    autocmd!
    autocmd WinEnter * silent execute set local syntax=ON
    autocmd WinLeave * silent execute set local syntax=OFF
augroup END


" =============================================================================
" TODO:
" =============================================================================

" vim:tw=78:ts=4:fdm=marker

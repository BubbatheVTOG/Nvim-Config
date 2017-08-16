" =============================================================================
" PLUGINS
" =============================================================================
" install vim-plug if it is not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Plugins listed after this line
" -----------------------------------------------------------------------------
call plug#begin()
Plug 'tpope/vim-fugitive'		" Git commands from ex mode.
Plug 'Xuyuanp/nerdtree-git-plugin'	" Git plugin for NerdTree.
Plug 'Yggdroot/indentLine'		" Shows line indents.
Plug 'yuttie/comfortable-motion.vim'	" Smooth scrolling.
Plug 'bronson/vim-trailing-whitespace'	" Fix white space by :FixWhitespace
Plug 'airblade/vim-gitgutter'		" Shows staged lines.
Plug 'vim-airline/vim-airline'		" Status bar.
Plug 'vim-airline/vim-airline-themes'	" Themes for status bar.
Plug 'sheerun/vim-polyglot'		" Syntax highlighting for a lot of languages. (Striped down, install specific ones if needed.)
Plug 'vim-syntastic/syntastic'		" Syntastic linter.
" Plug 'w0rp/ale' 			" Linter.
Plug 'tpope/vim-surround'		" Surround movement command.
Plug 'tpope/vim-sleuth' 		" Heuristic tabsizes.
Plug 'tpope/vim-repeat' 		" Repeat support for plugins.
Plug 'tpope/vim-speeddating'		" Date manipulation.
Plug 'scrooloose/nerdcommenter' 	" Commenting plugin.
Plug 'AndrewRadev/splitjoin.vim'	" Split or join lines.
Plug 'apalmer1377/factorus'		" Refactoring Plugin.
Plug 'machakann/vim-sandwich'		" Adds sandwich command for surrounding objects.
Plug 'rhysd/clever-f.vim'		" Super slick t/f movements.
Plug 'ervandew/supertab'		" Tab completion.
Plug 'machakann/vim-highlightedyank'	" Highlight yanked objects.
Plug 'godlygeek/tabular'		" Text alignment.
Plug 'thaerkh/vim-workspace'		" Save workspace.
Plug 'dylanaraps/wal'			" Wal color setting.
Plug 'matze/vim-move'			" Move text selections.
Plug 'vim-scripts/Tabmerge'		" Merge tab into split.
Plug 'vim-scripts/vimwiki'		" Build a wiki -> html.
Plug 'vim-scripts/SearchComplete'	" Tab completion inside of '/' search.
" Plug 'easymotion/vim-easymotion'	" Motions on speed.
Plug 'junegunn/vim-easy-align' 		" Easily align text.
Plug 'terryma/vim-multiple-cursors' 	" Multiple cursors.
Plug 'reedes/vim-wordy' 		" Word usage for writing.
" Plug 'AnthonyAstige/ctrlhjkl.vim' 	" Easier move between splits/buffers/windows.

" THIS IS NOT CONFIGURED
if has('nvim')
	Plug 'Shougo/deoplete.nvim',	{'do': ':UpdateRemotePlugins'} 	" Omnicompletion for neovim
else
	Plug 'Shougo/neocomplete.vim' 	" Omnicompletion for vim
endif

Plug 'artur-shaik/vim-javacomplete2',	{'for':['java']}		" Auto complete for Java...but only in java files.
Plug 'lervag/vimtex',			{'for':['tex']}			" Tex Utility
Plug 'xuhdev/vim-latex-live-preview',	{'for':['tex']}			" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'mbbill/undotree',			{'on':['UndoSreeToggle']}	" Create an undotree.
Plug 'cohama/agit.vim', 		{'on':['Agit']} 		" Git log viewer.
Plug 'lilydjwg/colorizer',		{'on':['ColorToggle']}		" Hex code colorizer
Plug 'scrooloose/nerdtree',		{'on':['NERDTreeToggle']}	" Its NerdTree...but only when its toggled.
Plug 'johngrib/vim-game-code-break',	{'on':['VimGameCodeBreak']}	" Brick Breaker
Plug 'vim-scripts/LanguageTool',	{'on':['LanguageToolCheck','LanguageToolClear']}	" Grammar checking.
Plug 'vim-scripts/todo-vim',		{'on':['TODOToggle']}
Plug 'roman/golden-ratio', 		{'on':['GoldenRatioToggle']} 	" Change split sizes on focus change.
Plug 'davidbeckingsale/writegood.vim',	{'on':['WritegoodToggle']} 	" Writting utility.
Plug 'johngrib/vim-game-snake', 	{'on':['VimGameSnake']} 	" Snake!
Plug 'omaraboumrad/vim-life', 		{'on':['GOL']} 			" Game of life
Plug 'metakirby5/codi.vim',		{'on':['Codi']}			" Interactive scratchpad.
call plug#end()				" required


" =============================================================================
" GENERAL CONFIGURATION
" =============================================================================
filetype plugin indent on		" Syntax for different file types. Plus autoindent for that file type.
set path+=**				" appends $PATH to find command
syntax on				" Syntax on bitch.
set wildmenu				" allows us to use the wildcard file menu
set background=dark			" Use text colors that look good on a dark background.
set autoindent				" Auto intent to the same col when on new line.
set smarttab				" Auto insert tabs spaces for curly braces.
set mouse=a 				" Enables mouse.
set ruler				" Enables cursor location.
set wrap lbr 				" Wrap on words.
set nocompatible			" Disables legacy stuff?
set showmode				" Shows what mode you're in.
set showcmd				" Show partial command in status line.
set showmatch				" Show matching brackets.
set splitright 				" Open new horizontal splits right of the current one.
set splitbelow 				" Open new vertical splits below the current one.
set completeopt=longest,menuone 	" Better autocompletion.
" set autowriteall 			" Autosave files.
set hidden 				" Buffers become hidden when abandonded.
set autoread 				" Reload the file when it changes outside of (n)vim.
set visualbell 				" Use visual bell instead of beeping.
set history=1000 			" Increase history.
set undolevels=1000 			" Increase undo levels.
autocmd BufWinLeave *.* mkview		" Save folds on exit.
autocmd BufWinEnter *.* silent loadview	" Create folds from save.

" Search
" -----------------------------------------------------------------------------
set hlsearch				" While searching, highlight (and search) as you type.
set incsearch				" While searching, take you directly to where the so far typed pattern matches.
set ignorecase				" While searching, ignore case.
set smartcase				" While searching, use capitals when you use capitals.
set showmatch				" While search, show exact matches.

" Line Numbers
" -----------------------------------------------------------------------------
set relativenumber			" Enable relative number position when using 'set number'
set number				" Enable line numbering.

" Backups
" -----------------------------------------------------------------------------
set nobackup 				" Disable backups. YOLO
set noswapfile 				" Disable swapfiles.


" =============================================================================
" LANGUAGE SPECIFIC SETTINGS
" From :h ft-$LANGUAGE
" =============================================================================

" Java
" -----------------------------------------------------------------------------
autocmd FileType java let java_highlight_debug=1
autocmd FileType java let java_highlight_functions="style"


" =============================================================================
" CUSTOM KEYBINDS
" =============================================================================

" CONTROVERSY
nnoremap ; :
" Clear search highlights
nnoremap ,nh	:noh<CR>
" Leader defined
let mapleader = ","
" Change movement behavior for wrapped lines.
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
" Change movement behavior for wrapped lines in operator-pending mode(ex:d6j)
onoremap <silent> j gj
onoremap <silent> k gk

" Keymaps for custom functions.
" -----------------------------------------------------------------------------
nnoremap <leader>fc	:Flash<CR>
nnoremap <leader>sc	:ToggleSpell<CR>
nnoremap <leader>bg	:ToggleBG<CR>
nnoremap <leader>so	:Source<CR>
nnoremap <leader>su	:Sudo<CR>
nnoremap <leader>ev	:e $MYVIMRC<CR>
" Only load these if in neovim.
if has('nvim)
	nnoremap <leader>ts	:TermSplit<CR>
	nnoremap <leader>tt	:TermTab<CR>
	nnoremap <leader>hs	:HtopVsplit<CR>
	nnoremap <leader>ht	:HtopTab<CR>
	nnoremap <leader>tc	:TTYClock<CR>
endif

" Custom Key Mappings For Builtin Commands
" -----------------------------------------------------------------------------
" Tab navigation similar to web browser behaviors.
" tab new (requires file name or path or %)
nnoremap <C-t>		:tabnew
" tab new in insert mode (requires file name or path or %)
inoremap <C-t>		<Esc>:tabnew
" insert mode tab new
nnoremap <C-q>		:tabclose<CR>
" insert mode tab close
inoremap <C-q>		<Esc>:tabclose<CR>


" =============================================================================
" PLUGIN CONFIGURATION
" =============================================================================

" NERDTree config
" -----------------------------------------------------------------------------
" Open NERDTree bind
nnoremap <Space>	:NERDTreeToggle<CR>
let NERDTreeMouseMode = 3
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeDirArrows = 1
let NERDTreeHijackNetrw = 1
" let NERDTreeMinimalUI = 1
let NERDTreeChDirMode = 2
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeCascadeOpenSingleChildDir = 0

" Java Complete 2 Config
" -----------------------------------------------------------------------------
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
" Enable smart inserting class imports with F4
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
" Enable unusual inserting class imports with F5
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
" Add all missing imports with F5
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
" Remove all missing imports with F7
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

" IndentLines Config
" -----------------------------------------------------------------------------
let g:indentLine_enabled = 1		" Enable indentLine
let g:indentLine_faster = 1		" DO NOT DISABLE WHILE USING THIS PLUGIN
let g:indentLine_color_term = 239	" Set indentLine color
let g:indentLine_char = '.'		" Set indentLine symbol(This does nothing apparently)
set list lcs=tab:\·\ 			" set indentLine for tabs (this actually changes the symbol lol)

" GitGutter Config
" -----------------------------------------------------------------------------
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
set updatetime=250			" update vim faster
let g:gitgutter_enabled = 1		" enable gitgutter

" Ctags Config
" -----------------------------------------------------------------------------
" ^] to jump to tag under cursor
" g^] for amiguous tags
" ^t to jump back to the tag stack
command! MakeTags !ctags -R .

" Neovim Terminal Mode Config
" -----------------------------------------------------------------------------
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	autocmd TermOpen * setlocal statusline=%{b:term_title}
endif

" Airline Config
" -----------------------------------------------------------------------------
let g:airline_theme='wal'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ' | '
let g:airline_powerline_fonts = 0

" AirLine (unicode) symbols
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
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

" Syntastic recommended settings. (Currently disabled)
" -----------------------------------------------------------------------------
" Global Settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Ale recommended settings.
" -----------------------------------------------------------------------------
" " Set this. Airline will handle the rest.
" let g:airline#extensions#ale#enabled = 1
" " Change linting frequency. (default:always,never,insert,normal)
" " let g:ale_lint_on_text_changed = never
" " Change linting to insertleave event. (default:1,0)
" let g:ale_lint_on_insert_leave = 1
" " Only lint on enter. (default:1,0)
" " g:ale_lint_on_enter = 1

" LaTeX Settings
" -----------------------------------------------------------------------------
" :LLPStartPreview	" To start live preview
" let g:livepreview_engine = 'your_engine' . ' [options]'	" To change compiler
" let g:livepreview_engine 	= 'pdftex'
let g:livepreview_previewer 	= 'zathura'

" CSS Color Settings
" -----------------------------------------------------------------------------
" ColorToggle
nnoremap <leader>ct	:ColorToggle<CR>
" Stop jacking my binds.
let g:colorizer_nomap = 1
" General settings
let g:colorizer_auto_color	= 1
let g:colorizer_x11_name	= 1
let g:colorizer_maxlines	= 500

" Smooth Scroll Settings
" -----------------------------------------------------------------------------
" Smooth Scroll the j and k keys.
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
"
" Intervals
let g:comfortable_motion_interval = 1000/60	" Default = 1000/60
let g:comfortable_motion_friction = 80.0	" Default = 80.0
let g:comfortable_motion_air_drag = 2.0		" Default = 2.0

" SplitJoin
" -----------------------------------------------------------------------------
" Split a single line with gS
" Join a block to a line with gJ

" Tabular
" -----------------------------------------------------------------------------
" HOW TO USE:
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

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
nnoremap <leader><Space> :UndotreeToggle<CR>

" Vim-Session
" -----------------------------------------------------------------------------
" Save session
nnoremap <leader>ss	:ToggleWorkspace<CR>
" Save session default name
let g:workspace_session_name = '.saved_session.vim'

" Wal
" -----------------------------------------------------------------------------
" Set the colorscheme to wal
" (Enabling this messes up indentLine plugin, and is unneeded.)
" colorscheme wal

" Vim-move
" -----------------------------------------------------------------------------
let g:move_key_modifier = 'C'

" NERDCommenter
" -----------------------------------------------------------------------------
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1
let NERDTrimTraillingWhitespace = 1

" Deoplete (TODO: @configure deopleted)
" -----------------------------------------------------------------------------
" 1500 lines of config...ugh, just Google it.

" Vim-wiki (TODO: @configure vim-wiki)
" -----------------------------------------------------------------------------
" see :h vimwiki-syntax
" see :h vimwiki-mappings

" LanguageTool (TODO: @configure LanguageTool)
" -----------------------------------------------------------------------------
" :LanguageToolCheck
" :LanguageToolClear

" Todo-vim 
" -----------------------------------------------------------------------------
" :TODOToggle
nnoremap <leader>td	:TODOToggle<CR>\<C-w>

" Golden-ratio 
" -----------------------------------------------------------------------------
nnoremap <leader>gr	:GoldenRatioToggle<CR>
" :h golden-ratio
" :GoldenRatioToggle
" :GoldenRatioResize

" Easymotion (TODO: @configure easymotion)
" -----------------------------------------------------------------------------
" help easymotion.txt

" Vim-easy-align (TODO: @configure vim-easy-align)
" -----------------------------------------------------------------------------
" :h vim-easy-align

" Vim-multiple-cursors (TODO: @configure vim-multiple-cursors)
" -----------------------------------------------------------------------------
" h; vim-multiple-cursors

" Wordy (TODO: @configure wordy)
" -----------------------------------------------------------------------------
" :Wordy

" Writegood (TODO: @configure writegood)
" -----------------------------------------------------------------------------
" :h writegood.txt

" Vimgamesnake
" -----------------------------------------------------------------------------
" Use: ":VimGameSnake"

" GOL (Game of Life)
" -----------------------------------------------------------------------------
" :e glider.txt
" :GOL (to start)
" :GOL (to stop)

" Ctrlhjkl (TODO: @refactor)
" -----------------------------------------------------------------------------
" Stop jacking my binds pls.
let g:ctrlhjkl_suppress_keymaps = 1

" Normal mode maps
nmap <s-j> <Plug>CtrlHJKLGoJn
nmap <s-k> <Plug>CtrlHJKLGoKn
nmap <s-h> <Plug>CtrlHJKLGoHn
nmap <s-l> <Plug>CtrlHJKLGoLn

" Normal mode quit...not a good idea.
nmap <s-q> <Plug>CtrlHJKLClose

" ex-mode maps
xmap <s-j> <Plug>CtrlHJKLMoveJ
xmap <s-k> <Plug>CtrlHJKLMoveK
xmap <s-h> <Plug>CtrlHJKLMoveH
xmap <s-l> <Plug>CtrlHJKLMoveL

" =============================================================================
" CUSTOM FUNCTIONS
" =============================================================================

" Change Keyboard Brightness on mode B)
" -----------------------------------------------------------------------------
autocmd InsertEnter * silent! call system('echo 50 > /sys/class/leds/chromeos::kbd_backlight/brightness')
autocmd InsertLeave * silent! call system('echo 1 > /sys/class/leds/chromeos::kbd_backlight/brightness')

" Only create these functions if we are in neovim.
if has('nvim')
	" TTYClock()
" -----------------------------------------------------------------------------
	" This executes ttyclock in a new full screen tab.
	" Requires the host to have tty-clock installed.
	function TTYClock()
		let g:indentLine_enabled = 0
		exec "tabnew term://tty-clock -C 6 -txbsrc"
	endfunction
	command TTYClock silent! call TTYClock()

	" Cmatrix()
" -----------------------------------------------------------------------------
	" This executes cmatrix in a new full screen tab.
	" Requires the host to have cmatrix installed.
	function Cmatrix()
		let g:indentLine_enabled = 0
		exec "tabnew term://cmatrix -a -C cyan"
	endfunction
	command Cmatrix silent! call Cmatrix()

	" Htop()
" -----------------------------------------------------------------------------
	" This executes htop in a new full screen tab.
	" Requires the host to have htop installed.
	function Htop(window)
		if a:window ==? "tabnew"
			exec "tabnew term://htop"
		endif
		if a:window ==? "vsplit"
			exec "vsplit term://htop"
			exec "normal! \<C-w>r\<C-w>\<C-w>"
		endif
		" TODO:Change this to elseif, with else echom'ing bad command'
	endfunction
	command HtopTab silent! call Htop("tabnew")
	command HtopVsplit silent! call Htop("vsplit")

	" Terminal Split
" -----------------------------------------------------------------------------
	" Just make a terminal and split it on the right side.
	function TermSplit()
		let g:indentLine_enabled=0
		" TODO: change the next line to open in working directory"
		exec "vsplit term://zsh"
		exec "terminal!"
	endfunction
	command TermSplit silent! call TermSplit()

	" Terminal Tab
" -----------------------------------------------------------------------------
	" Just make a terminal in a new tab ffs.
	function TermTab()
		exec "tabnew term://zsh"
		exec "terminal!"
	endfunction
	command TermTab silent! call TermTab()
endif

" Speed Profiling
" -----------------------------------------------------------------------------
" Lets you see what plugins/external commands are slowing down vim.
function ProfileStart()
	exec "profile start profile.log"
	exec "profile func *"
	exec "profile file *"
	echo "Do the actions you want profiled, then call :ProfileEnd"
endfunction
command ProfileStart silent! call ProfileStart()

function ProfileEnd()
	exec "profile pause"
	exec "noautocmd qall!"
endfunction
command ProfileEnd silent! call ProfileEnd()

" Crosshair Flash()
" -----------------------------------------------------------------------------
" This will flash cols and rows to locate the cursor
function Flash()
	set cursorline cursorcolumn
	redraw
	sleep 200m
	set nocursorline nocursorcolumn
endfunction
command Flash silent! call Flash()

" ToggleSpell()
" -----------------------------------------------------------------------------
" This will toggle spell check.
function ToggleSpell()
	if &spell
		exec "set nospell"
		echom "Spell Check OFF"
	else
		exec "set spell"
		echom "Spell Check ON"
	endif
endfunction
command ToggleSpell silent! call ToggleSpell()

" ToggleBG()
" -----------------------------------------------------------------------------
" Toggle background between light and dark
" This can be rewritten like this:
" map ,b :let &background = ( &background == "dark"? "light" : "dark" )<CR>
function ToggleBG()
	if &background ==? "dark"
		exec "set background=light"
	else
		exec "set background=dark"
	endif
endfunction
command ToggleBG silent! call ToggleBG()

" Source
" -----------------------------------------------------------------------------
" Sources the vimrc file dynamically.
function Source()
	exec "source $MYVIMRC"
	sleep 100m
	exec "AirlineRefresh"
endfunction
command Source silent! call Source()

" Sudo - Reopen a file with sudo permission
" -----------------------------------------------------------------------------
function Sudo()
	exec "w !sudo tee %"
endfunction
command Sudo silent! call Sudo()

" " Configure Color Column (Built in)
" " -----------------------------------------------------------------------------
	" let &colorcolumn=join(range(81,81),",")			" Set bar at column 81
	" let &colorcolumn="80,".join(range(121,121),",")		" Set bar at column121

	" " Make that line black w/ a bit of blue.
	" highlight ColorColumn ctermbg=235 guibg=#003333


" =============================================================================
" TODO:
" =============================================================================
"
" (Plug-in) https://github.com/terryma/vim-multiple-cursors
" (Plug-in) Get rid of manual commenter and install https://github.com/scrooloose/nerdcommenter
" (Enhancement) skeleton file insertion
" (Enhancement) test "if has('neovim')&&has('external shell command') for functions

" vim:tw=78:ts=8

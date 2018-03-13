	     " ██████╗ ██╗   ██╗██████╗ ██████╗  █████╗ ███████╗
	     " ██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝
	     " ██████╔╝██║   ██║██████╔╝██████╔╝███████║███████╗
	     " ██╔══██╗██║   ██║██╔══██╗██╔══██╗██╔══██║╚════██║
	     " ██████╔╝╚██████╔╝██████╔╝██████╔╝██║  ██║███████║
	     " ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

	 "  ██╗███╗   ██╗██╗ ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
	 " ██╔╝████╗  ██║╚██╗██║   ██║██║████╗ ████║██╔══██╗██╔════╝
	 " ██║ ██╔██╗ ██║ ██║██║   ██║██║██╔████╔██║██████╔╝██║
	 " ██║ ██║╚██╗██║ ██║╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
	 " ╚██╗██║ ╚████║██╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
	 "  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

" =============================================================================
" PLUGINS
" =============================================================================

" Environmental Setup {{{1
" Use `$nvim -u $(location to vimrc)` to tirgger this event.
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
"}}}1

" Plugins {{{1
" -----------------------------------------------------------------------------
call plug#begin()
Plug 'AndrewRadev/splitjoin.vim'	" Split or join lines.
Plug 'Chiel92/vim-autoformat' 		" Auto code formating. May require system packages.
Plug 'Xuyuanp/nerdtree-git-plugin'	" Git plugin for NerdTree.
Plug 'Yggdroot/indentLine'		" Shows line indents.
Plug 'airblade/vim-gitgutter'		" Shows staged lines.
Plug 'apalmer1377/factorus'		" Refactoring Plugin.
Plug 'bronson/vim-trailing-whitespace'	" Fix white space by :FixWhitespace
Plug 'ctrlpvim/ctrlp.vim' 		" ControlP (this could be triggerd but then the bind doesn't work) {'on':['CtrlP','CtrlPBuffer','CtrlPMRU','CtrlPMixed']}
Plug 'dylanaraps/wal.vim'		" Wal color setting.
Plug 'ervandew/supertab'		" Tab completion.
Plug 'godlygeek/tabular'		" Text alignment.
Plug 'junegunn/vim-easy-align' 		" Easily align text.
Plug 'machakann/vim-highlightedyank'	" Highlight yanked objects.
Plug 'majutsushi/tagbar' 		" Shows all methods and variables.
Plug 'matze/vim-move'			" Move text selections.
Plug 'reedes/vim-wordy' 		" Word usage for writing.
Plug 'rhysd/clever-f.vim'		" Super slick t/f movements.
Plug 'scrooloose/nerdcommenter' 	" Commenting plugin.
Plug 'sheerun/vim-polyglot'		" Syntax highlighting for a lot of languages. (Striped down, install specific ones if needed.)
Plug 'terryma/vim-multiple-cursors' 	" Multiple cursors.
Plug 'thaerkh/vim-workspace'		" Save workspace.
Plug 'tomasr/molokai' 			" color theme for when wal is not installed.
Plug 'tpope/vim-fugitive'		" Git commands from ex mode.
Plug 'tpope/vim-repeat' 		" Repeat support for plugins.
Plug 'tpope/vim-sleuth' 		" Heuristic tabsizes.
Plug 'tpope/vim-speeddating'		" Date manipulation.
Plug 'tpope/vim-surround'		" Surround movement command.
Plug 'vim-airline/vim-airline'		" Status bar.
Plug 'vim-airline/vim-airline-themes'	" Themes for status bar.
Plug 'vim-pandoc/vim-pandoc' 		" Pandoc.
Plug 'vim-scripts/SearchComplete'	" Tab completion inside of '/' search.
Plug 'vim-scripts/Tabmerge'		" Merge tab into split.
Plug 'w0rp/ale' 			" Linter.
Plug 'yuttie/comfortable-motion.vim'	" Smooth scrolling.
Plug 'roman/golden-ratio' 		" Change split sizes on focus change. This used to be a triggerd plugin. {'on':['GoldenRatioToggle']}
Plug 'lilydjwg/colorizer'		" Hex code colorizer. This used to be a triggered plugin. {'on':['ColorToggle']}
" Plug 'ap/vim-css-color' 		" Colorizer.
" Plug 'easymotion/vim-easymotion'	" Motions on speed.
" Plug 'kana/vim-textobj-indent' 	" Defines indent object.(Currently broken.)
" Plug 'kana/vim-textobj-line' 		" Defines line object.(Currently broken.)
" Plug 'machakann/vim-sandwich'		" Adds sandwich command for surrounding objects.
" Plug 'suan/vim-instant-markdow'	" Instant markdown preview.
" Plug 'vim-pandoc/vim-pandoc-syntax' 	" Pandoc syntax.
" Plug 'vim-scripts/vimwiki'		" Build a wiki -> html.
"}}}1

" Triggered Plugins {{{1
if has('nvim')
	Plug 'Shougo/deoplete.nvim',	{'do': ':UpdateRemotePlugins'} 	" Omnicompletion for neovim
else
	Plug 'vim-syntastic/syntastic'	" Syntastic linter.
endif

Plug 'artur-shaik/vim-javacomplete2',	{'for':['java']}		" Auto complete for Java...but only in java files.
Plug 'aserebryakov/vim-todo-lists',	{'for':['todo']} 		" todo list on .todo files.
Plug 'lervag/vimtex',			{'for':['tex']}			" Tex Utility
Plug 'xuhdev/vim-latex-live-preview',	{'for':['tex']}			" A Vim Plugin for Lively Previewing LaTeX PDF Output
" Keep these next two plugins ordered and formated like this!
Plug 'mattn/webapi-vim', 		{'for':['markdown']} 		" Webapi for vim-quicklink.
	Plug 'christoomey/vim-quicklink', 	{'for':['markdown']} 	" Quickly create links in markdown files.
Plug 'cohama/agit.vim', 		{'on':['Agit']} 		" Git log viewer.
Plug 'davidbeckingsale/writegood.vim',	{'on':['WritegoodToggle']} 	" Writting utility.
Plug 'dhruvasagar/vim-table-mode', 	{'on':['TableModeToggle']} 	" Table creation plugin.
Plug 'johngrib/vim-game-code-break',	{'on':['VimGameCodeBreak']}	" Brick Breaker
Plug 'johngrib/vim-game-snake', 	{'on':['VimGameSnake']} 	" Snake!
Plug 'junegunn/goyo.vim', 		{'on':['Goyo']} 		" Distraction free writing.
Plug 'mbbill/undotree',			{'on':['UndotreeToggle']}	" Create an undotree.
Plug 'metakirby5/codi.vim',		{'on':['Codi']}			" Interactive scratchpad.
Plug 'omaraboumrad/vim-life', 		{'on':['GOL']} 			" Game of life
Plug 'scrooloose/nerdtree',		{'on':['NERDTreeToggle']}	" Its NerdTree...but only when its toggled.
Plug 'vim-scripts/LanguageTool',	{'on':['LanguageToolCheck','LanguageToolClear']}	" Grammar checking.
Plug 'vim-scripts/todo-vim',		{'on':['TODOToggle']} 		" Todo list
Plug 'zchee/deoplete-jedi', 		{'for':['python']} 		" Competion engin for python.
call plug#end()				" required
"}}}1

" =============================================================================
" GENERAL CONFIGURATION
" =============================================================================

" General Configuration {{{1
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
set nocompatible			" Disables legacy stuff. (for vim)
set showmode				" Shows what mode you're in.
set showcmd				" Show partial command in status line.
set showmatch				" Show matching brackets.
set splitright 				" Open new horizontal splits right of the current one.
set splitbelow 				" Open new vertical splits below the current one.
set completeopt=longest,menuone,preview	" Better autocompletion.
" set autowriteall 			" Autosave files.
set hidden 				" Buffers become hidden when abandonded.
set autoread 				" Reload the file when it changes outside of (n)vim.
set visualbell 				" Use visual bell instead of beeping.
set history=1000 			" Increase history.
set undolevels=1000 			" Increase undo levels.
set scrolloff=5 			" Sets the scroll off set.
set confirm 				" Prompt conformation dialogs
" }}}1

" Folding {{{
" -----------------------------------------------------------------------------
set foldmethod=marker			" sets manual foldmarkers
highlight Folded ctermbg=black ctermfg=blue
" nmap <leader>f0 :set foldlevel=0<CR>
" nmap <leader>f1 :set foldlevel=1<CR>
" nmap <leader>f2 :set foldlevel=2<CR>
" nmap <leader>f3 :set foldlevel=3<CR>
" nmap <leader>f4 :set foldlevel=4<CR>
" nmap <leader>f5 :set foldlevel=5<CR>
" nmap <leader>f6 :set foldlevel=6<CR>
" nmap <leader>f7 :set foldlevel=7<CR>
" nmap <leader>f8 :set foldlevel=8<CR>
" nmap <leader>f9 :set foldlevel=9<CR>
" autocmd BufWinLeave *.* mkview		" Save folds on exit.
" autocmd BufWinEnter *.* silent loadview	" Create folds from save.
"}}}

" Search {{{1
" -----------------------------------------------------------------------------
set hlsearch				" While searching, highlight (and search) as you type.
" This will be removed when #2198 becomes released.
set incsearch				" While searching, take you directly to where the so far typed pattern matches.
set ignorecase				" While searching, ignore case.
set smartcase				" While searching, use capitals when you use capitals.
set showmatch				" While search, show exact matches.
" }}}1

" Line Numbers {{{1
" -----------------------------------------------------------------------------
set relativenumber			" Enable relative number position when using 'set number'
set number				" Enable line numbering.
" }}}1

" Backups {{{1
" -----------------------------------------------------------------------------
set nobackup 				" Disable backups. YOLO
set noswapfile 				" Disable swapfiles.
" }}}1

" Persistant Undo{{{1
" -----------------------------------------------------------------------------
" " Use persistent history.
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp/.vim-undo-dir
set undofile
" }}}1

" Color Schemes {{{1
" -----------------------------------------------------------------------------
" This will manage color scheme stuff since we don't know if the host has wal
" installed.
if !empty(glob('/usr/bin/wal'))
    let g:airline_theme = 'wal'
    colorscheme wal
else
    let g:airline_theme = 'molokai'
    colorscheme molokai
endif
"}}}1

" =============================================================================
" LANGUAGE SPECIFIC SETTINGS
" From :h ft-$LANGUAGE
" =============================================================================

" Java {{{1
" -----------------------------------------------------------------------------
autocmd FileType java let java_highlight_debug=1
autocmd FileType java let java_highlight_functions="style"

" This requires "asytle" to be installed.
" augroup Fix_mah_Java
	" autocmd!
	" autocmd BufWritePre *.java exec ":Autoformat"
" augroup END
" }}}1

" Python {{{1
" -----------------------------------------------------------------------------
" This requires "pep8" to be installed.
" augroup Fix_mah_Python
	" autocmd!
	" autocmd BufWritePre *.py exec ":Autoformat"
" augroup END

" For highlighted numbers:
let python_no_number_highlight = 0

" For highlighted builtin functions:
let python_no_builtin_highlight = 0

" For highlighted standard exceptions:
let python_no_exception_highlight = 0

" For highlighted doctests and code inside:
let python_no_doctest_highlight = 0

"}}}1

" Vimwiki/Markdown {{{1
" -----------------------------------------------------------------------------
" Binds
autocmd Filetype vimwiki,markdown nnoremap <leader>cl i[<++>](<++>)

" Filetype Configuration.
augroup filetype_wiki
	autocmd!
	autocmd FileType vimwiki,markdown set tabstop=4
	autocmd FileType vimwiki,markdown set shiftwidth=4
augroup END

" This needs to be replaced with:
" let g:pandoc#command#custom_open
" let g:pandoc#command#autoexec_on_writes

" augroup md_to_pdf_and_update_view
	" autocmd!
	" autocmd BufWritePost *.{mmd,md,mdown,mkd,mkdn,markdown,mdwn} exec ":Pandoc pdf"
	" autocmd BufWritePost *.{mmd,md,mdown,mkd,mkdn,markdown,mdwn} exec ":Pandoc html"
	" if has('nvim')
		" autocmd Filetype vimwiki,markdown call jobstart(['zathura', expand('%<') . '.pdf'])
		" autocmd Filetype vimwiki,markdown call jobstart(['python', "-m", "http.server", "8000"])
	" endif
" augroup END

" }}}1

" HTML{{{1
" -----------------------------------------------------------------------------
" HTML skeleton file insertion
nnoremap <leader>wh	:-1read $HOME/.vim/templates/html.skel<CR>
"}}}1

" =============================================================================
" CUSTOM KEYBINDS
" =============================================================================

" CONTROVERSY {{{1
" -----------------------------------------------------------------------------
nnoremap ; :
" }}}1

" Leader Defined {{{1
" -----------------------------------------------------------------------------
let mapleader = ","
" }}}1

" Clear Search Highlights {{{1
" -----------------------------------------------------------------------------
nnoremap <leader>nh	:noh<CR>
" }}}1

" Fold Binds {{{1
" -----------------------------------------------------------------------------
nnoremap <Space> 	za
" Create classic fold.
nnoremap <leader>of 	:fold<CR>
" Create unnumberd fold.
nnoremap <leader>cf 	:fold<CR>4li<CR><ESC>ka<SPACE><SPACE><ESC>i
" Create numbered fold.
nnoremap <leader>nf 	:fold<CR>4li<++><CR><ESC>A<++><ESC><S-o><BS><++><ESC>k2hi<SPACE><SPACE><ESC>i
" }}}1

" Change movement behavior for wrapped lines. {{{1
" -----------------------------------------------------------------------------
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
" }}}1

" Change movement behavior for wrapped lines in operator-pending mode(ex:d6j){{{1
" -----------------------------------------------------------------------------
onoremap <silent> j gj
onoremap <silent> k gk
" }}}1

" Keymaps for custom functions. {{{1
" -----------------------------------------------------------------------------
nnoremap <leader>fc	:Flash<CR>
nnoremap <leader>sc	:ToggleSpell<CR>
nnoremap <leader>bg	:ToggleBG<CR>
nnoremap <leader>so	:Source<CR>
nnoremap <leader>st 	:SourceThis<CR>
nnoremap <leader>su	:Sudo<CR>
nnoremap <leader>ev	:e $MYVIMRC<CR>
nnoremap <leader>tg	:TODOToggle<CR>
nnoremap <leader>sf	:SpellFix<CR>
nnoremap <leader>us 	:UserColorColumn<CR>
" }}}1

" Only create these binds if in neovim. {{{1
if has('nvim')
	nnoremap <leader>ts	:TermSplit<CR>
	nnoremap <leader>tt	:TermTab<CR>
	nnoremap <leader>hs	:HtopVsplit<CR>
	nnoremap <leader>ht	:HtopTab<CR>
	nnoremap <leader>tc	:TTYClock<CR>
endif
" }}}1

" Marker Replace {{{1
" -----------------------------------------------------------------------------
inoremap <leader>mr <ESC>/<++><CR>"_d4l:noh<CR>i
nnoremap <leader>mr /<++><CR>"_d4l:noh<CR>i
" }}}1

" Split movement. {{{1
" -----------------------------------------------------------------------------
" This maps keys to move between splits easier.
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-L> <C-W>l
" }}}1

" Visual mode code block indentation. {{{1
" -----------------------------------------------------------------------------
" When visually selecting a block and changing the indentation, don't unselect.
vnoremap < <gv
vnoremap > >gv
" }}}1

" Custom keybinds for tabs. {{{1
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
" }}}1

" Buffer Prev/Next Binds {{{1
" -----------------------------------------------------------------------------
" These binds are for changing buffers.
inoremap <leader>bn 	<ESC>:bnext<CR>
inoremap <leader>bp 	<ESC>:bprevious<CR>
nnoremap <leader>bn  	:bnext<CR>
nnoremap <leader>bp 	:bprevious<CR>
"}}}1

" =============================================================================
" PLUGIN CONFIGURATION
" =============================================================================

" NERDTree config {{{1
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
" }}}1

" Java Complete 2 Config {{{1
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
" }}}1

" IndentLines Config {{{1
" -----------------------------------------------------------------------------
let g:indentLine_enabled = 1		" Enable indentLine
let g:indentLine_faster = 1		" DO NOT DISABLE WHILE USING THIS PLUGIN
let g:indentLine_color_term = 239	" Set indentLine color
let g:indentLine_char = '.'		" Set indentLine symbol(This does nothing apparently)
set list lcs=tab:\·\ 			" set indentLine for tabs (this actually changes the symbol lol)
" }}}1

" GitGutter Config {{{1
" -----------------------------------------------------------------------------
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
set updatetime=250			" update vim faster
let g:gitgutter_enabled = 1		" enable gitgutter
" }}}1

" SuperTab {{{1
" -----------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"
"}}}1

" Ctags Config {{{1
" -----------------------------------------------------------------------------
" ^] to jump to tag under cursor
" g^] for amiguous tags
" ^t to jump back to the tag stack
command! MakeTags !ctags -R .
" }}}1

" Neovim Terminal Mode Config {{{1
" -----------------------------------------------------------------------------
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	autocmd TermOpen * setlocal statusline=%{b:term_title}
endif
" }}}1

" Airline Config {{{1
" -----------------------------------------------------------------------------
" This is all of the Airline configs.
" This next line is set in the Color Schemes section.
" let g:airline_theme='wal'
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
" }}}1

" Syntastic recommended settings. {{{1
" -----------------------------------------------------------------------------
" Global Settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" }}}1

" LaTeX Settings {{{1
" -----------------------------------------------------------------------------
" :LLPStartPreview	" To start live preview
" let g:livepreview_engine = 'your_engine' . ' [options]'	" To change compiler
" let g:livepreview_engine 	= 'pdftex'
let g:livepreview_previewer 	= 'zathura'
" }}}1

" CSS Color Settings {{{1
" -----------------------------------------------------------------------------
" ColorToggle
nnoremap <leader>ct	:ColorToggle<CR>
" Stop jacking my binds.
let g:colorizer_nomap = 1
" General settings
let g:colorizer_auto_color	= 1
let g:colorizer_x11_name	= 1
let g:colorizer_maxlines	= 500
" }}}1

" Smooth Scroll Settings {{{1
" -----------------------------------------------------------------------------
" Smooth Scroll the j and k keys.
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
"
" Intervals
let g:comfortable_motion_interval = 1000/60	" Default = 1000/60
let g:comfortable_motion_friction = 80.0	" Default = 80.0
let g:comfortable_motion_air_drag = 2.0		" Default = 2.0
" }}}1

" SplitJoin {{{1
" -----------------------------------------------------------------------------
" Split a single line with gS
" Join a block to a line with gJ
" }}}1

" Tabular {{{1
" -----------------------------------------------------------------------------
" HOW TO USE:
" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" }}}1

" Vim-Highlightedyank {{{1
" -----------------------------------------------------------------------------
" Bind y to activate plugin.
map y <Plug>(highlightedyank)
" Highlight time in milliseconds. '-1' makes in infinite.
let g:highlightedyank_highlight_duration = 1000
" }}}1

" Aget {{{1
" -----------------------------------------------------------------------------
nnoremap <leader>ag	:Agit<CR>
" }}}1

" UndoTree {{{1
" -----------------------------------------------------------------------------
nnoremap <leader>ut :UndotreeToggle<CR>
" }}}1

" Vim-Session {{{1
" -----------------------------------------------------------------------------
" Save session
nnoremap <leader>ss	:ToggleWorkspace<CR>
" Save session default name
let g:workspace_session_name = '.saved_session.vim'
" }}}1

" Wal {{{1
" -----------------------------------------------------------------------------
" Set the colorscheme to wal
" (Enabling this messes up indentLine plugin, and is unneeded.)
" colorscheme wal
" }}}1

" Vim-move {{{1
" -----------------------------------------------------------------------------
let g:move_key_modifier = 'C'
" }}}1

" NERDCommenter {{{1
" -----------------------------------------------------------------------------
let NERDSpaceDelims = 1
let NERDRemoveExtraSpaces = 1
let NERDTrimTraillingWhitespace = 1
" }}}1

" Deoplete {{{1
" -----------------------------------------------------------------------------
" 1500 lines of config...ugh, just Google it.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
"let g:deoplete#complete_method = 'omnifunc'
" }}}1

" Vim-wiki {{{1
" -----------------------------------------------------------------------------
" see :h vimwiki-syntax
" see :h vimwiki-mappings

" Use real markdown.
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

" Mappings.
autocmd Filetype vimwiki nnoremap <leader>vl :VimwikiVSplitLink<CR>
autocmd Filetype vimwiki nnoremap <leader>hl :VimwikiSplitLink<CR>
autocmd Filetype vimwiki nnoremap <leader>ah :VimwikiAll2HTML<CR>
autocmd Filetype vimwiki nnoremap <leader>bc :Vimwiki2HTMLBrowse<CR>
" }}}1

" Vim-instant-markdown {{{1
" -----------------------------------------------------------------------------
let g:instant_markdown_slow = 1 			" Reduced compile/refresh.
let g:instant_markdown_autostart = 0 			" Disable autostart. :InstantMarkdownPreview
" let g:instant_markdown_open_to_the_world = 1 		" Open webserver to the world.
" let g:instant_markdown_allow_unsafe_content = 1 	" Allow scripts.
" let g:instant_markdown_allow_external_content = 0 	" Disable external content.
" }}}1

" Pandoc {{{1
" -----------------------------------------------------------------------------
" Disable Pandoc folding.
let g:pandoc#modules#disabled = ["folding"]
"}}}1

" LanguageTool (TODO: @configure LanguageTool) {{{1
" -----------------------------------------------------------------------------
" :LanguageToolCheck
" :LanguageToolClear
" }}}1

" Todo-vim {{{1
" -----------------------------------------------------------------------------
" :TODOToggle
nnoremap <leader>td	:TODOToggle<CR>\<C-w>
" }}}1

" Golden-ratio {{{1
" -----------------------------------------------------------------------------
nnoremap <leader>gr	:GoldenRatioToggle<CR>
" :h golden-ratio
" :GoldenRatioToggle
" :GoldenRatioResize
" }}}1

" Easymotion (TODO: @configure easymotion) {{{1
" -----------------------------------------------------------------------------
" help easymotion.txt
" }}}1

" Vim-easy-align (TODO: @configure vim-easy-align) {{{1
" -----------------------------------------------------------------------------
" :h vim-easy-align
" }}}1

" Vim-multiple-cursors (TODO: @configure vim-multiple-cursors) {{{1
" -----------------------------------------------------------------------------
" h; vim-multiple-cursors
" }}}1

" Wordy (TODO: @configure wordy) {{{1
" -----------------------------------------------------------------------------
" :Wordy
" }}}1

" Writegood (TODO: @configure writegood) {{{1
" -----------------------------------------------------------------------------
" :h writegood.txt
" }}}1

" Vimgamesnake {{{1
" -----------------------------------------------------------------------------
" Use: ":VimGameSnake"
" }}}1

" GOL (Game of Life) {{{1
" -----------------------------------------------------------------------------
" :e glider.txt
" :GOL (to start)
" :GOL (to stop)
" }}}1

" Goyo (distraction free writing) {{{1
" -----------------------------------------------------------------------------
" TODO: make a meaningful bind
nnoremap <leader>gy :Goyo<cr>
"}}}1

" CtrlP {{{1
" -----------------------------------------------------------------------------
" Config for CtrlP.
" :h ctrlp@en
" Mapings for CtlP.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Ignore .git directory.
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Start search from start of directory containinng .git folder.
" More options here: https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_working_path_mode = 'r'
"}}}1

" Tag Bar {{{1
" -----------------------------------------------------------------------------
" This is all the config for tag bar.
nnoremap <leader>tb 	:TagbarToggle<CR>
inoremap <leader>tb 	<ESC>:TagbarToggle<CR>
"}}}1

" Ale {{{1
" -----------------------------------------------------------------------------
" " Set this. Airline will handle the rest.
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
" JavaScript REQURIES: eslint
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

" }}}1

" =============================================================================
" CUSTOM FUNCTIONS
" =============================================================================

" Change Keyboard Brightness on mode B) {{{1
" -----------------------------------------------------------------------------
" Only do this if on a chromebook. {{{2
if !empty(glob('/sys/class/leds/chromeos::kbd_backlight/brightness'))
	autocmd InsertEnter * silent! call system('echo 50 > /sys/class/leds/chromeos::kbd_backlight/brightness')
	autocmd InsertLeave * silent! call system('echo 1 > /sys/class/leds/chromeos::kbd_backlight/brightness')
endif
" }}}2
" Only do this if on a samsung. {{{2
if !empty(glob('/sys/class/leds/samsung::kbd_backlight/brightness'))
	autocmd InsertEnter * silent! call system('echo 6 > /sys/class/leds/samsung::kbd_backlight/brightness')
	autocmd InsertLeave * silent! call system('echo 1 > /sys/class/leds/samsung::kbd_backlight/brightness')
endif
" }}}2
" }}}1

" Only create these functions if we are in neovim. {{{1
if has('nvim')

	" TTYClock() {{{2
" -----------------------------------------------------------------------------
	" This executes ttyclock in a new full screen tab.
	" Requires the host to have tty-clock installed.
	function! TTYClock()
		if system('if [ -e /usr/bin/tty-clock ]; then echo true; fi') =~ "true"
			let g:indentLine_enabled = 0
			exec "tabnew term://tty-clock -C 6 -txbsrc"
		else
			echom "TTYClock NOT installed on host system!"
		endif
	endfunction
	command! TTYClock silent! call TTYClock()
	" }}}2

	" Cmatrix() {{{2
" -----------------------------------------------------------------------------
	" This executes cmatrix in a new full screen tab.
	" Requires the host to have cmatrix installed.
	function! Cmatrix()
		if system('if [ -e /usr/bin/cmatrix ]; then echo true; fi') =~ "true"
			let g:indentLine_enabled = 0
			exec "tabnew term://cmatrix -a -C cyan"
		else
			echom "Cmatrix NOT installed on host system!"
		endif
	endfunction
	command! Cmatrix silent! call Cmatrix()
	" }}}2

	" Htop() {{{2
" -----------------------------------------------------------------------------
	" This executes htop in a new full screen tab.
	" Requires the host to have htop installed.
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
	" }}}2

	" Terminal Split {{{2
" -----------------------------------------------------------------------------
	" Just make a terminal and split it on the right side.
	function TermSplit()
		let g:indentLine_enabled=0
		" TODO: change the next line to open in working directory"
		exec "vsplit term://zsh"
		exec "terminal!"
	endfunction
	command TermSplit silent! call TermSplit()
	" }}}2

	" Terminal Tab {{{2
" -----------------------------------------------------------------------------
	" Just make a terminal in a new tab ffs.
	function TermTab()
		exec "tabnew term://zsh"
		exec "terminal!"
	endfunction
	command TermTab silent! call TermTab()
	" }}}2
endif
" }}}1

" Speed Profiling {{{1
" -----------------------------------------------------------------------------
" Lets you see what plugins/external commands are slowing down vim.
function! ProfileStart() "{{{2
	exec "profile start profile.log"
	exec "profile func *"
	exec "profile file *"
	echo "Do the actions you want profiled, then call :ProfileEnd"
endfunction
command ProfileStart silent! call ProfileStart()
" }}}2

function! ProfileEnd() "{{{2
	exec "profile pause"
	exec "noautocmd qall!"
endfunction
command ProfileEnd silent! call ProfileEnd()
" }}}2
" }}}1

" Crosshair Flash() {{{1
" -----------------------------------------------------------------------------
" This will flash cols and rows to locate the cursor
function! Flash()
	set cursorline cursorcolumn
	redraw
	sleep 200m
	set nocursorline nocursorcolumn
endfunction
command Flash silent! call Flash()
" }}}1

" ToggleSpell() {{{1
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
" }}}1

" SpellFix() {{{1 
" -----------------------------------------------------------------------------
function! SpellFix()
	normal! mp[s1z=`p
endfunction
command SpellFix silent! call SpellFix()
"}}}1

" ToggleBG() {{{1
" -----------------------------------------------------------------------------
" Toggle background between light and dark
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
" }}}1

" Source() {{{1
" -----------------------------------------------------------------------------
" Sources the vimrc file dynamically.
function! Source()
	exec "source $MYVIMRC"
	sleep 100m
	exec "AirlineRefresh"
endfunction
command Source silent! call Source()
" }}}1

" SourceThis() {{{1
" -----------------------------------------------------------------------------
" Sources the vimrc file dynamically.
function! SourceThis()
	exec "source %"
	sleep 100m
	exec "AirlineRefresh"
endfunction
command SourceThis silent! call SourceThis()
" }}}1

" Sudo() - Reopen a file with sudo permission {{{1
" -----------------------------------------------------------------------------
function! Sudo()
	exec "w !sudo tee %"
endfunction
command Sudo silent! call Sudo()
" }}}1

" Configure Color Column {{{1
" -----------------------------------------------------------------------------
let g:UserColorColumnBool=0
function! UserColorColumn()
    if g:UserColorColumnBool==1
	let &colorcolumn=0
	let g:UserColorColumnBool=0
    else
	let &colorcolumn=join(range(81,81),",")			" Set bar at column 81
	let &colorcolumn="80,".join(range(121,121),",")		" Set bar at column121
	let g:UserColorColumnBool=1
    endif
endfunction
command UserColorColumn silent call UserColorColumn()
call UserColorColumn()

" Make that line black w/ a bit of blue.
highlight ColorColumn ctermbg=235 guibg=#003333
" }}}1

" Auto-Resize {{{1
" -----------------------------------------------------------------------------
autocmd VimResized * execute "normal! \<C-w>="
"}}}1

" =============================================================================
" TODO:
" =============================================================================
"
" (Enhancement) skeleton file insertion
" (Enhancement) SpellFix() confirms replacement, or at least echo's changes.
" (FIX) 	LineIndent colorschemes clash.
" (Fix) 	md_to_pdf_and_update_view, make this togglable.

" vim:tw=78:ts=8:fdm=marker

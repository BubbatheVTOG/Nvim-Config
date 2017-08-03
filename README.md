# Nvim-Config
<strong>This is my config for <a href="https://github.com/neovim/neovim">neovim</a>.</strong>
<hr width="75%" align="center" noshade>
<p>This is a .vimrc that requires plugins and external dependencies.</p>
<p>This VIM config uses <a href=https://github.com/junegunn/vim-plug>vim-plug</a> as the plugin manager.</p>
<hr width="75%" align="center" noshade>
<strong>It looks like this...</strong>
<a href="http://imgur.com/iiRj5dB"><img src="http://i.imgur.com/iiRj5dB.png" title="source: imgur.com" /></a>
<p>This shows some plugins (syntastic,colorizer,nerdtree) with one theme.</p>
<a href="http://imgur.com/NGTbJH6"><img src="http://i.imgur.com/NGTbJH6.png" title="source: imgur.com" /></a>
<p>This shows some plugins (syntastic,colorizer,nerdtree) using a different theme.</p>
<a href="http://imgur.com/X9Sap29"><img src="http://i.imgur.com/X9Sap29.png" title="source: imgur.com" /></a>
<p>Just some general code/formatting appearance.</p>
<hr width="75%" align="center" noshade>
<strong>Software Dependencies:</strong>
<ul>
	<li>ctags (optional)
	<li>python-neovim (needed for java2complete)
</ul>
<hr width="75%" align="center">
<strong>Plugins Currently In Use:</strong>
<ul>
	<li><a href=http://github.com/lilydjwg/colorizer>colorizer</a>
	<li><a href=http://github.com/yuttie/comfortable-motion.vim>comfortable-motion.vim</a>
	<li><a href=https://github.com/apalmer1377/factorus>factorus></a>
	<li><a href=http://github.com/Yggdroot/indentLine>indentLine</a>
	<li><a href=http://github.com/scrooloose/nerdtree>nerdtree</a>
	<li><a href=http://github.com/Xuyuanp/nerdtree-git-plugin>nerd-git-plugin</a>
	<li><a href=http://github.com/AndreRadev/splitjoin.vim>splitjoin.vim</a>
	<li><a href=http://github.com/vim-syntastic/syntastic>syntastic</a>
	<li><a href=http://github.com/vim-airline/vim-airline>air-line</a>
	<li><a href=http://github.com/vim-airline/vim-airline-themes>air-line-themes</a>
	<li><a href=http://github.com/tpope/vim-fugitive>vim-fugitive</a>
	<li><a href=http://github.com/johngrib/vim-game-code-break>vim-game-code-break</a>
	<li><a href=http://github.com/airblade/vim-gitgutter>vim-gitgutter</a>
	<li><a href=http://github.com/xuhdev/vim-latex-live-preview>vim-latex-live-preview</a>
	<li><a href=http://github.com/junegunn/vim-plug>vim-plug</a>
	<li><a href=http://github.com/sheerun/vim-plyglot>vim-polyglot</a>
	<li><a href=http://github.com/tpope/vim-surround>vim-surround</a>
	<li><a href=http://github.com/tpope/vim-sleuth>vim-sleuth</a>
	<li><a href=http://github.com/tpope/vim-repeat>vim-repeat</a>
	<li><a href=http://github.com/tpope/vim-speeddating>vim-speeddating</a>
	<li><a href=http://github.com/bronson/vim-trailing-whitespace>vim-trailing-whitespace</a>
	<li><a href=http://github.com/lervag/vimtex>vimtex</a>
	<li><a href=http://github.com/metakirby5/codi.vim'>codi.vim</a>
	<li><a href=http://github.com/mechakann/vim-sandwich>vim-sandwich</a>
	<li><a href=http://github.com/rhysd/clever-f.vim>clever-f.vim</a>
	<li><a href=http://github.com/Shougo/deoplete.nvim>deoplete.nvim</a>
	<li><a href=http://github.com/Shougo/neocomplete.vim>neocomplete.vim</a>
	<li><a href=http://github.com/ervandew/supertab>supertab</a>
	<li><a href=http://github.com/cohama/agit.vim>agit.vim</a>
	<li><a href=http://github.com/machakann/vim-highlightedyank>vim-highlightedyank</a>
	<li><a href=http://github.com/mbbill/undotree>undotree</a>
	<li><a href=https://github.com/godlygeek/tabular>tabular</a>
	<li><a href=https://github.com/thaerkh/vim-workspace>vim-workspace</a>
	<li><a href=https://github.com/dylanaraps/wal>wal</a>
	<li><a href=https://github.com/matze/vim-move>vim-move</a>
	<li><a href=https://github.com/vim-scripts/Tabmerge>Tabmerge</a>
	<li><a href=https://github.com/scrooloose/nerdcommenter>nerdcommenter</a>
	<li><a href=https://github.com/Shougo/deoplete.nvim>deoplete.nvim</a>
	<li><a href=https://github.com/vim-scripts/vimwiki>vimwiki</a>
	<li><a href=https://github.com/vim-scripts/LanguageTool>LanguageTool</a>
	<li><a href=https://github.com/vim-scripts/todo-vim>todo-vim</a>
	<li><a href=https://github.com/roman/golden-ratio>golden-ratio</a>
	<li><a href=https://github.com/easymotion/vim-easymotion>vim-easymotio</a>
	<li><a href=https://github.com/junegunn/vim-easy-align>vim-easy-align</a>
	<li><a href=https://github.com/terryma/vim-multiple-cursors>vim-multiple-cursors</a>
	<li><a href=https://github.com/reedes/vim-wordy>vim-wordy</a>
	<li><a href=https://github.com/davidbeckingsale/writegood.vim>writegood.vim</a>
	<li><a href=https://github.com/johngrib/vim-game-snake>vim-game-snake</a>
	<li><a href=https://github.com/omaraboumrad/vim-life>vim-life</a>
	<li><a href=https://github.com/AnthonyAstige/ctrlhjkl.vim>ctrlhjkl.vim</a>
</ul>
<br>
<hr width="75%" align="center" noshade>
<p>Installation:
<ul>
	<li><code>git clone https://github.com/BubbatheVTOG/Nvim-Config.git</code>
	<li><code>ln -s /location/to/Nvim-config/vimrc ~/.vimrc</code>
</ul>
<p>When you open up (n)vim, vim-plug will install. It might error out a bit..but just keep hitting enter. When its done call <code>:PlugInstall</code> again.
<br>
<hr width="75%" align="center" noshade>
<strong>TODO:</strong>
<p>A more up-do-date TODO list can be found at the bottom of the configuration file.
<ul>
	<li>Plugins that I want to install/configure but haven't had time:
	<ul>
		<li>https://github.com/terryma/vim-multiple-cursors
		<li>bufferHJKL movements
		<li>https://github.com/AnthonyAstige/ctrlhjkl.vim
		<li>https://github.com/jvanja/vim-bootstrap4-snippets
		<li>https://github.com/termhn/i3-vim-nav ?
		<li>https://github.com/neomake/neomake
	</ul>
	<li>Enhancements or fixes I want to implement when I have time or an idea of how to fix it.
	<ul>
		<li><u>configure deoplete</u>
		<li>seletion file insertion
		<li>add test for functions like,"has('neovim')&&has('externel shell binary')
		<li>add test for if has('wal'), to load wal, or to load another colorscheme and airlinetheme.
		<li>add toggle for columncolor stuff*81,121)
		<li>configure easymotions https://github.com/easymotion/vim-easymotion
		<li>put in folds using fdl and such.
		<li>config goldenratio to be disabled when it enter syntastic split.
	</ul>
</ul>

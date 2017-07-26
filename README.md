# Nvim-Config
<strong>This is my config for <a href="https://github.com/neovim/neovim">neovim</a>.</strong>
<hr width="75%" align="center" noshade>
<strong>It looks like this...</strong>
<a href="http://imgur.com/iiRj5dB"><img src="http://i.imgur.com/iiRj5dB.png" title="source: imgur.com" /></a>
<p>This shows some plugins (syntastic,colorizer,nerdtree) with one theme.</p>
<a href="http://imgur.com/NGTbJH6"><img src="http://i.imgur.com/NGTbJH6.png" title="source: imgur.com" /></a>
<p>This shows some plugins (syntastic,colorizer,nerdtree) using a different theme.</p>
<a href="http://imgur.com/X9Sap29"><img src="http://i.imgur.com/X9Sap29.png" title="source: imgur.com" /></a>
<p>Just some general code/formatting appearance.</p>
<hr width="75%" align="center" noshade>
<p>This is a .vimrc that requires plugins and other software.</p>
<p>This VIM config uses <a href=https://github.com/junegunn/vim-plug>vim-plug</a> as the plugin manager.</p>
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
	<li><a href=http://github.com/Yggdroot/indentLine>indentLine</a>
	<li><a href=http://github.com/scrooloose/nerdtree>nerdtree</a>
	<li><a href=http://github.com/Xuyuanp/nerdtree-git-plugin>nerd-git-plugin</a>
	<li><a href=http://github.com/AndreRadev/splitjoin.vim>splitjoin.vim</a>
	<li><a href=http://github.com/ervandew/supertab>supertab</a>
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
	<li><a href=http://github.com/bronson/vim-trailing-whitespace>vim-trailing-whitespace</a>
	<li><a href=http://github.com/lervag/vimtex>vimtex</a>
</ul>
<br>
<hr width="75%" align="center" noshade>
<p>To install vim plug:
<ul>
	<li><pre>$mkdir -p ~/.config/nvim/autoload</pre>
	<li><pre>$ln -s ~/.config/nvim/init.vim .location.to.your.vimrc</pre>
	<li><pre>#cd ~/.config/nvim/autoload && curl -fLo plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim</pre>
	<li><pre>$nvim</pre>
	<li><pre>:PlugUpdate</pre>
</ul>
<br>
<p>It should look like this:</p>
<pre>
.config
├── nvim
│   ├── autoload
│   │   └── plug.vim
│   ├── init.vim -> /home/$USER/git/simple.vimrc/vimrc
</pre>
<br>
<hr width="75%" align="center" noshade>
<strong>TODO:</strong>
<p>A more up-do-date TODO list can be found at the bottom of the configuration file.
<ul>
	<li>Plugins that I want to install/configure but haven't had time:
	<ul>
		<li>Supertab/YouCompleteMe plugin
		<li>https://github.com/terryma/vim-multiple-cursors
		<li>Get rid of manual commenter and install https://github.com/scrooloose/nerdcommenter
		<li>tpope plugin to auto adjust tab width: https://github.com/tpope/vim-sleuth
		<li>bufferHJKL movements
		<li>https://github.com/jvanja/vim-bootstrap4-snippets
	</ul>
	<li>Enhancements or fixes I want to implement when I have time or an idea of how to fix it.
	<ul>
		<li>https://github.com/AnthonyAstige/ctrlhjkl.vim
		<li>Configure LaTeX more
		<li>Source .vimrc funciton
		<li>reopen in sudo mode funciton
		<li>seletion file insertion
		<li>add test for functions like,"has('neovim')&&has('externel shell binary')
		<li>make function use silent!
	</ul>
</ul>

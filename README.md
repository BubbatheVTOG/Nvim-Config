# NOTsimple.nvimrc
<strong>This is a SIMPLE .vimrc (.nvimrc) for nvim.</strong>
<p><strong>Check out the simple.vimrc branch if you want to keep it simple ;)</strong></p>
<p>This is a .vimrc that requires plugins and other software to get the most use out of.</p>
<p>This VIM config uses <a href=https://github.com/junegunn/vim-plug>vim-plug</a> as the plugin manager.</p>
<hr width="75%" align="center" noshade>
<strong>Software Needed:</strong>
<ul>
<li>ctags (optional)
<li>python-neovim (needed for java2complete)
</ul>
<hr width="75%" align="center">
<strong>Plugins Currently In Use:</strong>
<ul>
<li>vim-plug (detailed below)
<li>vim-fugitive
<li>nerdtree
<li>nerdtree-git-plugin
<li>indentLine
<li>comfortable-motion.vim
<li>vim-trailing-whitespace
<li>vim-gitgutter
<li>vim-airline
<li>vim-airline-themes
<li>vim-plyglot
<li>syntastic
<li>vimtex
<li>vim-latex-live-preview
<li>colorizer
<li>vim-surround
<li>vim-game-code-break
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
<strong>It looks like this...</strong>
<a href="http://imgur.com/y9wF8Tm"><img src="http://i.imgur.com/y9wF8Tm.png" title="source: imgur.com" /></a>
<p>This picture is old and of the NOTsimple.vimrc config.
<br>
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
<ul>https://github.com/AnthonyAstige/ctrlhjkl.vim
<li>Configure LaTeX more
<li>Source .vimrc funciton
<li>reopen in sudo mode funciton
<li>seletion file insertion
<li>add test for functions like,"has('neovim')&&has('externel shell binary')
<li>make function use silent!
</ul>
</ul>

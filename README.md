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
<hr width="75%" align="center">
<strong>Plugins Currently In Use:</strong>
<ul>
	<li><a href=https://github.com/Xuyuanp/nerdtree-git-plugin>nerd-git-plugin</a>
	<li><a href=https://github.com/airblade/vim-gitgutter>vim-gitgutter</a>
	<li><a href=https://github.com/cohama/agit.vim>agit.vim</a>
	<li><a href=https://github.com/ctrlpvim/ctrlp.vim>ctrlp</a>
	<li><a href=https://github.com/dylanaraps/wal>wal</a>
	<li><a href=https://github.com/junegunn/vim-plug>vim-plug</a>
	<li><a href=https://github.com/lilydjwg/colorizer>colorizer</a>
	<li><a href=https://github.com/machakann/vim-highlightedyank>vim-highlightedyank</a>
	<li><a href=https://github.com/majutsushi/tagbar>tagbar</a>
	<li><a href=https://github.com/mbbill/undotree>undotree</a>
	<li><a href=https://github.com/roman/golden-ratio>golden-ratio</a>
	<li><a href=https://github.com/scrooloose/nerdcommenter>nerdcommenter</a>
	<li><a href=https://github.com/scrooloose/nerdtree>nerdtree</a>
	<li><a href=https://github.com/sheerun/vim-plyglot>vim-polyglot</a>
	<li><a href=https://github.com/tpope/vim-fugitive>vim-fugitive</a>
	<li><a href=https://github.com/tpope/vim-repeat>vim-repeat</a>
	<li><a href=https://github.com/tpope/vim-sleuth>vim-sleuth</a>
	<li><a href=https://github.com/tpope/vim-speeddating>vim-speeddating</a>
	<li><a href=https://github.com/tpope/vim-surround>vim-surround</a>
	<li><a href=https://github.com/vim-airline/vim-airline-themes>air-line-themes</a>
	<li><a href=https://github.com/vim-airline/vim-airline>air-line</a>
	<li><a href=https://github.com/vim-scripts/LanguageTool>LanguageTool</a>
	<li><a href=https://github.com/neoclide/coc.nvim>coc</a>
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
<hr width="75%" align="center" noshade>
<strong>LSP (coc.nvim)</strong>
<ul>
	<li><code>coc-settings.json</code> lives here and is symlinked to
	<code>~/.config/nvim/coc-settings.json</code>:
	<code>ln -s /location/to/Nvim-Config/coc-settings.json ~/.config/nvim/coc-settings.json</code>
	<li><code>eslint.enable</code> is <b>false</b> globally because coc-eslint
	starts a server in every buffer, configured or not. Enable it per repository
	with a project-local <code>.vim/coc-settings.json</code> containing
	<code>{"eslint.enable": true}</code>.
	<li>Removed extensions: <code>coc-clock</code> (registers
	<code>'TabEnter '</code>-style events that Neovim 0.12 rejects),
	<code>coc-import-cost</code> (missing <code>tslib</code>),
	<code>coc-github</code> (shells out to git on every completion),
	<code>coc-rls</code> (abandoned), <code>coc-marketplace</code> (network at
	startup), <code>coc-discord-neovim</code> (deprecated).
	<li><code>nvim-treesitter</code> tracks <code>main</code>, which dropped
	<code>nvim-treesitter.configs</code>. Highlighting is started per buffer from
	a <code>FileType</code> autocmd; install parsers with
	<code>:TSInstall &lt;lang&gt;</code>.
	<li><code>coc-snippets</code> expands snippet completions; <code>&lt;C-j&gt;</code>
	and <code>&lt;C-k&gt;</code> jump between placeholders. <code>coc-pairs</code>
	auto-closes brackets.
	<li><code>which-key.nvim</code> shows a popup after a <code>&lt;leader&gt;</code>
	prefix (300 ms delay, <code>modern</code> preset).
	<li><b>Required binaries</b> for the plugins above: <code>tree-sitter</code> (CLI,
	needed by every <code>:TSInstall</code> on the nvim-treesitter main branch),
	<code>maven</code> and <code>gradle</code> (jdtls import + Java test runs),
	<code>ctags</code> (tagbar, coc-tag), <code>pynvim</code> (Neovim's python3
	provider; coc-snippets probes it once per session).
	<li>Install them with <code>./install-editor-tools.sh</code> (dnf / pacman /
	apk). It mirrors the <code>Dockerfile</code>'s dependency list and leaves
	shell/CLI tooling to <code>sigint/dotfiles/install-cli-tools.sh</code>. It
	does not install neovim or a JDK: run your own nvim build, and coc-java
	manages its own JDK 23.
</ul>

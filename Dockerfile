FROM alpine

ENV CONTAINER=true

RUN apk add --no-cache nodejs npm neovim python3 python2 git curl sed py3-pip py-pip cmatrix htop \
	&& npm install -g neovim \
	# && pip3 install neovim \
	# && pip install neovim \
	&& adduser -D nvim \
	&& mkdir /home/nvim/mountpoint

USER nvim

WORKDIR /home/nvim

COPY vimrc .vimrc

RUN sed '/GENERAL CONFIGURATION/q' .vimrc > install.vim \
	&& nvim -u install.vim +PlugInstall \
	&& rm install.vim; exit 0

RUN nvim -u .vimrc -c 'CocInstall -sync coc-pairs coc-marketplace coc-github coc-clock coc-yaml coc-wxml coc-vimlsp coc-tsserver coc-sh coc-python coc-phpls coc-html coc-docker coc-css | qall'

WORKDIR /home/nvim/mountpoint

ENTRYPOINT /usr/bin/nvim -u /home/nvim/.vimrc

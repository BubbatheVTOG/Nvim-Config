FROM centos

ENV CONTAINER=true

RUN dnf install -y epel-release \
	&& dnf install -y nodejs npm \
	python36 python2 git curl htop \
	java-11-openjdk-devel clang \
	&& npm install -g neovim \
	&& pip3 install neovim \
	&& pip2 install neovim \
	&& dnf clean all

RUN adduser -m -g users -s /bin/bash nvim \
	&& mkdir /home/nvim/mountpoint

USER nvim

WORKDIR /home/nvim

RUN curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage \
	&& chmod u+x nvim.appimage \
	&& ./nvim.appimage --appimage-extract \
	&& chmod +x ./squashfs-root/usr/bin/nvim \
	&& chown nvim ./squashfs-root/usr/bin/nvim

COPY vimrc .vimrc

RUN sed '/GENERAL CONFIGURATION/q' .vimrc > install.vim \
	&& ./squashfs-root/usr/bin/nvim -u install.vim +PlugInstall +qall \
	&& rm install.vim; exit 0

RUN ./squashfs-root/usr/bin/nvim -u .vimrc -c 'CocInstall -sync coc-pairs coc-marketplace coc-github coc-clock coc-yaml coc-wxml coc-vimlsp coc-tsserver coc-sh coc-python coc-phpls coc-html coc-docker coc-css coc-clangd coc-java coc-python | qall'

WORKDIR /home/nvim/mountpoint

VOLUME /home/nvim/mountpoint

ENTRYPOINT /home/nvim/squashfs-root/usr/bin/nvim -u /home/nvim/.vimrc

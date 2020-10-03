FROM centos as base
ENV CONTAINER=true
RUN dnf install -y epel-release \
	&& dnf install -y 'dnf-command(config-manager)' \
	&& dnf config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo \
	&& dnf install -y https://download-ib01.fedoraproject.org/pub/fedora-secondary/releases/30/Everything/i386/os/Packages/f/fzf-0.18.0-1.fc30.i686.rpm \
	&& dnf install -y nodejs npm python36 python2 \
		git curl ctags htop ripgrep \
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
RUN ./squashfs-root/usr/bin/nvim -u .vimrc -c 'CocInstall coc-clock coc-css coc-docker coc-eslint coc-github coc-html coc-import-cost coc-json coc-markdownlint coc-marketplace coc-phpls coc-prettier coc-python coc-sh coc-sql coc-tag coc-tsserver coc-ultisnips coc-vimlsp coc-xml coc-yaml | qall'
WORKDIR /home/nvim/mountpoint
VOLUME /home/nvim/mountpoint
ENTRYPOINT /home/nvim/squashfs-root/usr/bin/nvim -u /home/nvim/.vimrc

FROM base as cpp
WORKDIR /
USER root
RUN dnf install -y clang
USER nvim
WORKDIR /home/nvim
RUN ./squashfs-root/usr/bin/nvim -u .vimrc -c 'CocInstall -sync coc-clangd | qall'
WORKDIR /home/nvim/mountpoint
ENTRYPOINT /home/nvim/squashfs-root/usr/bin/nvim -u /home/nvim/.vimrc

FROM base as java
WORKDIR /
USER root
RUN dnf install -y java-11-openjdk-devel
USER nvim
WORKDIR /home/nvim
RUN ./squashfs-root/usr/bin/nvim -u .vimrc -c 'CocInstall -sync coc-java | qall'
WORKDIR /home/nvim/mountpoint
ENTRYPOINT /home/nvim/squashfs-root/usr/bin/nvim -u /home/nvim/.vimrc

FROM base as tenXdev
WORKDIR /
USER root
RUN dnf install -y java-11-openjdk-devel clang
USER nvim
WORKDIR /home/nvim
RUN ./squashfs-root/usr/bin/nvim -u .vimrc -c 'CocInstall -sync coc-java coc-clangd | qall'
WORKDIR /home/nvim/mountpoint
ENTRYPOINT /home/nvim/squashfs-root/usr/bin/nvim -u /home/nvim/.vimrc

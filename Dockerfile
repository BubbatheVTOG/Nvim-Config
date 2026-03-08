# ============================================================================
# Dockerfile - Neovim Development Environment
# ============================================================================
# Two-stage build:
# - base: Core Neovim with all dependencies (no Java)
# - java: Base + Java 25 + Maven
# ============================================================================

# ============================================================================
# STAGE 1: BASE IMAGE (Alpine 3.19 + Node 22)
# ============================================================================
FROM node:22-alpine as base

# Install base dependencies from Alpine repos
RUN apk add --no-cache \
    neovim \
    git curl wget make bash \
    ripgrep fzf \
    htop ctags \
    bat tree jq yq

# Install Python 3 pip and neovim Python package
RUN apk add --no-cache py3-pip \
    && pip3 install --break-system-packages neovim

# eza is not available for musl Alpine, skipping for now
# Can be installed manually later: curl -fsSL https://github.com/eza-community/eza/releases/latest/download/eza-x86_64-unknown-linux-gnu.tar.gz

# Create user and set up directories
RUN adduser -D -s /bin/bash nvim
USER nvim
WORKDIR /home/nvim



# Copy vimrc
COPY --chown=nvim:nvim vimrc .vimrc

# Install plug.vim plugin manager
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create minimal install.vim that only loads plugins
RUN cat > install.vim << 'EOF'
set nocompatible
filetype plugin indent on
syntax on
let mapleader=" "
EOF

# Extract and source plugin declarations from vimrc
RUN sed -n '/^call plug#begin()/,/^call plug#end()/p' .vimrc >> install.vim

# Run PlugInstall with the minimal config
RUN nvim -u install.vim +PlugInstall +qall

# Install all treesitter parsers
RUN nvim -u .vimrc +TSUpdate +qall

# Install all COC extensions (from vimrc configuration)
# Let vimrc handle it via g:coc_global_extensions on first run
RUN mkdir -p ~/.local/state/nvim/coc/extensions

# Setup volume mount point
WORKDIR /home/nvim/mountpoint
VOLUME /home/nvim/mountpoint
ENTRYPOINT ["/usr/bin/nvim", "-u", "~/.vimrc"]

# ============================================================================
# STAGE 2: JAVA IMAGE (Eclipse Temurin 25)
# ============================================================================
FROM eclipse-temurin:25-jdk-alpine as java

# Install neovim and other dependencies
RUN apk add --no-cache neovim bash git curl wget make

# Copy from base image
COPY --from=base /home/nvim /home/nvim
WORKDIR /home/nvim

# Install coc-java and coc-clangd extensions
# Create minimal init to avoid loading full vimrc during build
RUN cat > /tmp/minimal.vim << 'EOF'
set nocompatible
filetype plugin indent on
syntax on
let mapleader=" "
EOF
RUN nvim -u /tmp/minimal.vim -c 'silent! CocInstall coc-java coc-clangd' -c 'sleep 10m' -c 'qa!'

WORKDIR /home/nvim/mountpoint
ENTRYPOINT ["/usr/bin/nvim", "-u", "~/.vimrc"]

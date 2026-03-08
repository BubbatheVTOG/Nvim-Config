# ============================================================================
# Dockerfile - Neovim Development Environment
# ============================================================================
# Two-stage build:
# - base: Core Neovim with all dependencies (no Java)
# - java: Base + Java 25 + Maven
# ============================================================================

# ============================================================================
# STAGE 1: BASE IMAGE (Alpine 3.19)
# ============================================================================
FROM alpine:3.19 as base

# Install base dependencies from Alpine repos
RUN apk add --no-cache \
    neovim \
    git curl wget make \
    ripgrep fzf \
    htop ctags \
    bat tree jq yq

# Download and install Node.js 23.x from official releases
RUN curl -fsSL https://nodejs.org/dist/v23.3.0/node-v23.3.0-linux-musl-x64.tar.xz \
    -o /tmp/node.tar.xz \
    && tar -xJf /tmp/node.tar.xz -C /usr/local --strip-components=1 \
    && rm /tmp/node.tar.xz

# Install Python 3 pip and neovim Python package
RUN apk add --no-cache py3-pip \
    && pip3 install neovim

# Download and install eza from GitHub releases
RUN curl -fsSL https://github.com/eza-community/eza/releases/download/v0.20.0/eza-x86_64-unknown-linux-musl.tar.gz \
    -o /tmp/eza.tar.gz \
    && tar -xzf /tmp/eza.tar.gz -C /usr/local/bin \
    && chmod +x /usr/local/bin/eza \
    && rm /tmp/eza.tar.gz

# Create user and set up directories
RUN adduser -D -s /bin/bash nvim
USER nvim
WORKDIR /home/nvim

# Copy vimrc and install plugins
COPY --chown=nvim:nvim vimrc .vimrc
RUN nvim -u .vimrc +PlugInstall +qall

# Install all treesitter parsers
RUN nvim -u .vimrc +TSUpdate +qall

# Install all COC extensions (from vimrc configuration)
RUN nvim -u .vimrc \
    -c 'CocInstall -sync coc-clock coc-css coc-docker coc-eslint coc-github coc-html coc-import-cost coc-json coc-markdownlint coc-marketplace coc-phpls coc-prettier coc-python coc-sh coc-sql coc-tag coc-tsserver coc-vimlsp coc-xml coc-rls coc-angular coc-tailwindcss coc-yaml coc-elixir' \
    +qall

# Setup volume mount point
WORKDIR /home/nvim/mountpoint
VOLUME /home/nvim/mountpoint
ENTRYPOINT ["/usr/bin/nvim", "-u", "~/.vimrc"]

# ============================================================================
# STAGE 2: JAVA IMAGE (Eclipse Temurin 25)
# ============================================================================
FROM eclipse-temurin:25-jdk-alpine as java

# Install Maven
RUN apk add --no-cache maven

# Copy from base image
COPY --from=base /home/nvim /home/nvim
WORKDIR /home/nvim

# Install coc-java and coc-clangd extensions
RUN nvim -u /home/nvim/.vimrc \
    -c 'CocInstall coc-java coc-clangd' \
    +qall

WORKDIR /home/nvim/mountpoint
ENTRYPOINT ["/usr/bin/nvim", "-u", "~/.vimrc"]

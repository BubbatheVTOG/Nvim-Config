#!/bin/sh
# Install the host binaries the vimrc and its plugins expect.
#
# This is the package half of the setup: the vimrc guards features with
# executable() (ctags, node, fzf, rg, javac), coc extensions shell out to mvn,
# gradle and tree-sitter, and the Dockerfile installs the same set for
# containers. Keep this list and Dockerfile's apk list in step.
#
# Deliberately NOT installed: neovim itself (run your own build), and a JDK
# (coc-java ships and manages JDK 23 in ~/.config/coc/extensions).
#
# Idempotent: safe to re-run. Maps package names per distro:
#   Fedora (sigint) -> dnf    Arch (matt) -> pacman    Alpine -> apk
#
# Only the Arch names are exercised locally; Fedora and Alpine names are
# carried from the Dockerfile and upstream packaging and are worth a review
# on a host of that distro.
set -eu

# intentional word splitting on the package lists
# shellcheck disable=SC2086
FEDORA_PKGS="ripgrep fzf ctags bat tree jq yq make htop python3-pynvim maven gradle tree-sitter-cli"
# shellcheck disable=SC2086
ARCH_PKGS="ripgrep fzf ctags bat tree jq yq make htop python-pynvim maven gradle tree-sitter-cli"
# py3-pip carries pynvim on Alpine; the pip step below installs it.
# shellcheck disable=SC2086
ALPINE_PKGS="ripgrep fzf ctags bat tree jq yq make htop py3-pip maven gradle tree-sitter-cli"

if command -v dnf >/dev/null 2>&1; then
    echo "==> Fedora: dnf install"
    sudo dnf install -y $FEDORA_PKGS
elif command -v pacman >/dev/null 2>&1; then
    echo "==> Arch: pacman install (--needed skips up-to-date packages)"
    # --noconfirm keeps the script usable non-interactively, like `dnf -y`.
    sudo pacman -S --needed --noconfirm $ARCH_PKGS
elif command -v apk >/dev/null 2>&1; then
    echo "==> Alpine: apk install (mirrors the Dockerfile base stage)"
    sudo apk add --no-cache $ALPINE_PKGS
else
    echo "install-editor-tools.sh: no dnf, pacman or apk found" >&2
    exit 1
fi

# pynvim — Neovim's python3 provider. Distro packages cover Fedora and Arch
# above; Alpine installs the PyPI package, matching the Dockerfile.
if ! python3 -c 'import pynvim' >/dev/null 2>&1; then
    echo "==> pynvim: python3 provider missing, installing from PyPI"
    python3 -m pip install --break-system-packages --user pynvim
fi

# tree-sitter CLI — nvim-treesitter (main branch) shells out to
# `tree-sitter build` for every :TSInstall; without it installs fail ENOENT.
# Covered by the distro lists above; npm is the fallback for hosts that do not
# package it. The npm postinstall downloads a prebuilt binary, so its install
# script has to be allowed explicitly (some machines block them by default).
if command -v tree-sitter >/dev/null 2>&1; then
    echo "==> tree-sitter: present"
elif command -v npm >/dev/null 2>&1; then
    echo "==> tree-sitter CLI: npm fallback"
    npm install -g --allow-scripts=tree-sitter-cli tree-sitter-cli
fi

# A JDK is a prerequisite for maven and gradle, not something this script owns.
if ! command -v javac >/dev/null 2>&1; then
    echo "warn: no javac on PATH; maven, gradle and coc-java will not work" >&2
fi

echo "==> done. Next: :PlugInstall then :TSInstall <lang> in neovim."

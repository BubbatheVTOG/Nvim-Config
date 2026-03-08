# ============================================================================
# Neovim Docker Shell Functions
# ============================================================================
# Add these to your shell configuration:
# - For zsh: ~/.zshrc
# - For bash: ~/.bashrc
# ============================================================================

# Base Neovim (all features except Java)
nvim() {
    docker run -it --rm \
        --user "$(id -u):$(id -g)" \
        -v "$(pwd):/home/nvim/mountpoint" \
        nvim:base \
        "$@"
}

# Java Neovim (with Java + Maven support)
nvim-java() {
    docker run -it --rm \
        --user "$(id -u):$(id -g)" \
        -v "$(pwd):/home/nvim/mountpoint" \
        nvim:java \
        "$@"
}

#!/bin/sh
set -e

# Install pipx using the Python user environment
python3 -m pip install --user pipx
python3 -m pipx ensurepath

# Ensure pipx is in the PATH
export PATH="$PATH:$HOME/.local/bin"
pipx ensurepath
pipx ensurepath --global || true

# Install Ansible with dependencies via pipx
pipx install --include-deps ansible

# Install ansible-lint
pipx install ansible-lint
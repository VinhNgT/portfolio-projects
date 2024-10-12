#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Git configuration
echo "Configuring Git hooks..."
git config core.hooksPath .githooks

# Flutter configuration
echo "Configuring Flutter version with fvm..."
for dir in external_submodules/*; do
    if [ -d "$dir" ]; then
        (cd "$dir" && fvm use)
    fi
done

# Python configuration
echo "Configuring Python version with pyenv..."
pyenv exec python --version
pyenv exec pip --version

pyenv exec python -m venv .venv

case "$OSTYPE" in
darwin* | linux*) source .venv/bin/activate ;;
msys* | cygwin*) source .venv/Scripts/activate ;;
*) exit 1 ;;
esac

pyenv exec pip install -r requirements.txt

echo "Bootstrapping done!"

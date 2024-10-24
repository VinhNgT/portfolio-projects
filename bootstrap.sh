#!/bin/bash
set -e

# Check if required commands are installed
for cmd in fvm dart pyenv; do
    if ! command -v $cmd &>/dev/null; then
        echo "$cmd is not installed. Please install $cmd before running this script."
        exit 1
    fi
done

# Configuration variables
MELOS_WORKSPACE_DIR="melos_workspace"
EXTERNAL_SUBMODULES_DIR="external_submodules"

# Setup aliases for Windows
case "$OSTYPE" in
msys* | cygwin*)
    melos() {
        melos.bat "$@"
    }
    ;;
esac

# Install, activate and bootstrap melos
echo "Setting up melos workspace..."

cd "$MELOS_WORKSPACE_DIR"
dart pub global activate melos
melos bootstrap --skip-linking

# Helper function to run fvm use in a directory
run_use_fvm() {
    dir=$1
    echo "$dir"

    if [ ! -d "$dir" ]; then
        echo -e "\033[31mDirectory $dir does not exist.\033[0m" >&2
        exit 1
    fi

    if [ ! -f "$dir/.fvmrc" ]; then
        echo -e "\033[33mFile $dir/.fvmrc does not exist. Skipping...\033[0m" >&2
        return
    fi

    (cd "$dir" && fvm use --skip-pub-get)
}

# FVM configuration
echo "Configuring FVM for melos workspace..."
run_use_fvm .

echo "Configuring FVM for melos packages..."
melos_packages_info_json=$(melos list -r --json)
melos_package_locations=$(echo "$melos_packages_info_json" | jq -r '.[].location' | sed 's/\/[^/]*$//')

for location in $melos_package_locations; do
    run_use_fvm "$location"
done

cd ..
echo "Configuring FVM for external submodules..."
for dir in "$EXTERNAL_SUBMODULES_DIR"/*; do
    run_use_fvm "$dir"
done

# Python configuration
echo "Configuring Python version with pyenv..."
pyenv exec python --version
pyenv exec python -m venv .venv

case "$OSTYPE" in
darwin* | linux*) source .venv/bin/activate ;;
msys* | cygwin*) source .venv/Scripts/activate ;;
*) exit 1 ;;
esac

pyenv exec pip install -r requirements.txt

# Git configuration
echo "Configuring Git hooks..."
git config core.hooksPath .githooks

# Cleanup
echo -e "\033[32mBootstrapping done!\033[0m"

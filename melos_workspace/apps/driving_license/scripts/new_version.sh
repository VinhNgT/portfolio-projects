#!/bin/bash

set -e

# Read the current build_number
build_number=$(jq -r '.build_number' .appversion)

# Get user inputs
IS_PRERELEASE=false
IS_GRADUATE=false

while getopts "pg" opt; do
    case $opt in
    p)
        IS_PRERELEASE=true
        ;;
    g)
        IS_GRADUATE=true
        ;;
    \?)
        exit 1
        ;;

    esac
done

case "$OSTYPE" in
msys* | cygwin*)
    melos() {
        melos.bat "$@"
    }
    ;;
esac

PACKAGE_NAME="driving_license"

# Assign new pubspec.yaml version name using melos
melos version --all --scope="$PACKAGE_NAME" \
    $(if $IS_PRERELEASE; then echo "--prerelease"; fi) \
    $(if $IS_GRADUATE; then echo "--graduate"; fi)

# Bump .appversion build_number
jq '.build_number += 1' .appversion >tmp.$$.json && mv tmp.$$.json .appversion

# Git amend .appversion
git add .appversion
git commit --amend --no-edit

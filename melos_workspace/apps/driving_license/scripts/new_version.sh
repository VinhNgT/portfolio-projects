#!/bin/bash

set -e

PACKAGE_NAME="driving_license"

# Check if .appversion exists, if not, create it.
if [ ! -f .appversion ]; then
    create_appversion() {
        local default_build_number=0
        local default_build_name=$(yq e '.version' pkg_workspace/pubspec.yaml)

        jq -n \
            --arg build_number "$default_build_number" \
            --arg build_name "$default_build_name" \
            '{build_number: ($build_number | tonumber), build_name: $build_name}' >.appversion
    }

    create_appversion
fi

# Get build_number and build_name from .appversion
JSON=$(cat .appversion)
build_number=$(jq -r '.build_number' <<<"$JSON")
build_name=$(jq -r '.build_name' <<<"$JSON")

# echo "build_number: $build_number"
# echo "build_name: $build_name"

# Exit if build_number is empty or below 0
if [ -z "$build_number" ] ||
    ! [[ "$build_number" =~ ^[0-9]+$ ]] ||
    [ "$build_number" -lt 0 ]; then

    echo "Error: build_number is empty, not a number, or below 0"
    exit 1
fi

# Exit if build_name is empty
if [ -z "$build_name" ]; then
    echo "Error: build_name is empty"
    exit 1
fi

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

bump_version() {
    local json="$1"
    local new_build_number=$(jq -r '.build_number' <<<"$json")
    ((new_build_number += 1))
    local new_build_name=$(yq e '.version' pkg_workspace/pubspec.yaml)

    local result=$(echo "$JSON" |
        jq --argjson new_build_number "$new_build_number" \
            --arg new_build_name "$new_build_name" \
            '.build_number = $new_build_number |
            .build_name = $new_build_name')

    echo "$result"
}

# Assign new pubspec.yaml version name using melos
melos version --all --no-git-tag-version --scope="$PACKAGE_NAME" \
    $(if $IS_PRERELEASE; then echo "--prerelease"; fi) \
    $(if $IS_GRADUATE; then echo "--graduate"; fi)

# Check if the field 'version' in pubspec.yaml has changed. If not, it means melos did not
# update the package's version.
if [ $(yq e '.version' pkg_workspace/pubspec.yaml) == "$build_name" ]; then
    echo "version in pubspec.yaml has not changed"
    exit 0
fi

# Bump .appversion
new_json=$(bump_version "$JSON")
echo "New version:"
jq -r '.' <<<"$new_json"
echo "$new_json" >.appversion

# Git amend .appversion
git add .appversion
git commit --amend --no-edit

# Tag the commit with the new version using format 'driving_license-v1.1.2'
new_build_name=$(jq -r '.build_name' <<<"$new_json")
git tag "$PACKAGE_NAME-v$new_build_name"

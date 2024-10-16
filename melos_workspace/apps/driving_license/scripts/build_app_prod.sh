#!/bin/bash

set -e

# Read the current build_number
build_number=$(jq -r '.build_number' .appversion)

# Build the app for production
build_appbundle() {
    local build_obfuscation_dir="$1"
    local env_path = "$2"

    ./../.fvm/flutter_sdk/bin/flutter build apk \
        --flavor prod \
        --dart-define-from-file=$env_path \
        --obfuscate \
        --split-debug-info=$build_obfuscation_dir \
        --extra-gen-snapshot-options=--save-obfuscation-map=$build_obfuscation_dir/app.obfuscation.map.json \
        --build-number=$build_number

    ./../.fvm/flutter_sdk/bin/flutter build appbundle \
        --flavor prod \
        --dart-define-from-file=$env_path \
        --obfuscate \
        --split-debug-info=$build_obfuscation_dir \
        --extra-gen-snapshot-options=--save-obfuscation-map=$build_obfuscation_dir/app.obfuscation.map.json \
        --build-number=$build_number
}

make_file_links() {
    local relative_release_dir="$1"

    ln -s ../../app_workspace/build/app/outputs/bundle/prodRelease/app-prod-release.aab $relative_release_dir/app-prod-release.aab
    ln -s ../../app_workspace/build/app/outputs/flutter-apk/app-prod-release.apk $relative_release_dir/app-prod-release.apk
    ln -s ../../app_workspace/build/app/outputs/mapping/prodRelease/mapping.txt $relative_release_dir/mapping.txt
}

make_native_debug_symbols_zip() {
    local absolute_release_dir=$(realpath "$1")

    (cd app_workspace/build/app/intermediates/merged_native_libs/prodRelease/out/lib &&
        zip -r $absolute_release_dir/native_debug_symbols.zip .)
}

build_result_dir="build_result"
obfuscation_dir="$build_result_dir/obfuscation"
release_dir="$build_result_dir/release"

mkdir -p $build_result_dir

# Note: Do not delete this folder in subsequent builds because it won't be regenerated.
# https://github.com/flutter/flutter/issues/124141
mkdir -p $obfuscation_dir

rm -rf $release_dir
mkdir -p $release_dir

(cd app_workspace && build_appbundle "../$obfuscation_dir" "../envs/.env.production")

make_file_links $release_dir
make_native_debug_symbols_zip $release_dir

# Zip build_result folder
zip -r --filesync build_result.zip build_result

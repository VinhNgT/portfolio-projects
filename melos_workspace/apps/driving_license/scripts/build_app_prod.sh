#!/bin/bash

set -e

# Read the current build_number
build_number=$(jq -r '.build_number' .appversion)

# Build the app for production
{
    cd app_workspace

    BUILD_OBFUSCATION_DIR=../build_result/build_obfuscation

    ./../.fvm/flutter_sdk/bin/flutter build appbundle --flavor prod --obfuscate \
        --split-debug-info=$BUILD_OBFUSCATION_DIR \
        --extra-gen-snapshot-options=--save-obfuscation-map=$BUILD_OBFUSCATION_DIR/app.obfuscation.map.json \
        --build-number=$build_number

}

# app_workspace/build/app/intermediates/merged_native_libs/prodRelease/out/lib

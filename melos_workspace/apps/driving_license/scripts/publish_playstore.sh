#!/bin/bash

set -e

publish=false
is_draft=false

while getopts ":pd" opt; do
    case ${opt} in
    p)
        publish=true
        ;;
    d)
        is_draft=true
        ;;
    \?)
        echo "Invalid option: -$OPTARG" 1>&2
        exit 1
        ;;
    esac
done

if [ "$publish" = true ]; then
    echo "Publishing to Play Store"
else
    echo "Dry run, not publishing to Play Store, use publish_playstore.sh -p to publish"
fi

case "$OSTYPE" in
msys* | cygwin*)
    bundle() {
        bundle.bat "$@"
    }
    ;;
esac

cd app_workspace/android
bundle exec fastlane deploy_internal publish:$publish is_draft:$is_draft

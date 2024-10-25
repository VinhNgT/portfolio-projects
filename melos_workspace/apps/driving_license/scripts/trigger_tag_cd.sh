#!/bin/bash

# This script is used to force the CD pipeline to run by temporary assigning a
# new tag to the latest commit.
#
# This script should be used with care to prevent the CD pipeline from
# publishing unwanted versions.

set -e

TRIGGER_TAG_SUFFIX="dev.trigger_cd"

# Get the latest tag, if there is no tag, use "no_tag-v0.0.1"
latest_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "no_tag-v0.0.1")

# Add subfix TRIGGER_TAG_SUFFIX to the latest tag
trigger_tag="${latest_tag}-$TRIGGER_TAG_SUFFIX"
echo "Trigger tag: $trigger_tag"

# Remove tags that end with TRIGGER_TAG_SUFFIX from local and remote
tags_to_delete=$(git tag -l "*-$TRIGGER_TAG_SUFFIX")
if [ -n "$tags_to_delete" ]; then
    git tag -d $tags_to_delete
    git push origin --delete $tags_to_delete
fi

# # Add tag to local and remote
git tag "$trigger_tag"
git push origin "$trigger_tag"
echo "Trigger tag $trigger_tag has been created"

# Delete the trigger tag
git tag -d $trigger_tag
git push origin --delete $trigger_tag
echo "Trigger tag $trigger_tag has been deleted"

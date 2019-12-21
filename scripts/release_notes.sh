#!/usr/bin/env bash

RELEASE_NOTES_FILE="release-notes.md"

echo "## What's new?" > $RELEASE_NOTES_FILE
github-release-notes -org dikhan -repo release_notes -since-latest-release | grep -v "Version Update" >> $RELEASE_NOTES_FILE
echo >> $RELEASE_NOTES_FILE
echo "## Changelog"  >> $RELEASE_NOTES_FILE
git --no-pager log $(git describe --tags --abbrev=0)..HEAD --oneline --format="%h %s"  >> $RELEASE_NOTES_FILE
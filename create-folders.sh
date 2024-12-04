#!/bin/bash

SOURCE_PATH="./evernote-notebooks"
TARGET_PATH="./md-notebooks"

echo "Cleaning $TARGET_PATH"
rm -rf $TARGET_PATH

find $SOURCE_PATH -name "*.enex" | sed -e "s|$SOURCE_PATH|$TARGET_PATH|" | sed -e "s/.enex//" | tr "' " "-" | xargs -i{} mkdir -p {}

FOLDERS="$( find $TARGET_PATH -type d -empty | wc -l )"
NOTEBOOKS="$( find $SOURCE_PATH -type f -name "*.enex" | wc -l )"

echo "Source notebook count: $NOTEBOOKS"
echo "Output folder count: $FOLDERS"

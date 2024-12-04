#!/bin/bash

echo "Running conversion"
echo 

SOURCE_PATH="./evernote-notebooks"
TARGET_PATH="./md-notebooks"
EVERNOTE2MD_PATH="../evernote2md/bin/evernote2md"

NOTEBOOKS=()
readarray -t NOTEBOOKS < <(find $SOURCE_PATH -name "*.enex")

for (( i=0; i<${#NOTEBOOKS[@]}; i++));
do 
    NOTEBOOK=${NOTEBOOKS[$i]}
    TARGET_DIR="$(echo $NOTEBOOK | sed -e "s|$SOURCE_PATH|$TARGET_PATH|" | sed -e "s/.enex//" | tr "' " "-" | xargs -i{} echo {})"
    echo "index: $i, value: ${NOTEBOOK}, target: ${TARGET_DIR}"
    
    ./$EVERNOTE2MD_PATH "$NOTEBOOK" "$TARGET_DIR"
done

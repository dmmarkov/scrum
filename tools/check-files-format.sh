#!/bin/bash

echo "Files with trailing spaces"

grep --exclude-dir=.git --include=*.gd  --include=*.tscn --recursive '[[:blank:]]$' project

if test $? -eq 0; then
    echo "Fix this list of files!"
    exit 1
else
    echo "No files with trailing spaces"
fi

echo ""

echo "Files without newline at the end"

FILES=$(find project -type f -name *.gd -exec bash -c 'test -z "$(tail -c 1 {})" || echo {}' \;)

if test -z $FILES; then
    echo "No files without newline at the end"
    exit 0
else
    echo $FILES
fi

echo "Fix this list of files!"

exit 1

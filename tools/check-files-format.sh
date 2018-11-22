#!/bin/sh

echo "Files with trailing spaces"

grep --exclude-dir=.git --include=*.gd  --include=*.tscn --recursive '[[:blank:]]$' project || exit 0

echo "Fix this list of files!"

echo ""

echo "Files without newline at the end"

find project -type f -name *.gd -exec bash -c 'test -z "$(tail -c 1 {})" || echo {}' \;

echo "Fix this list of files!"

exit 1

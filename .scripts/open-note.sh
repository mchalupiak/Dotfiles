#!/bin/sh

FILE=$(rg --no-heading -n . | fzf)
FILEPATH=$(echo $FILE | sed 's/:.*//')
NUMBER=$(echo $FILE | cut -d':' -f2)
kak +$NUMBER $FILEPATH

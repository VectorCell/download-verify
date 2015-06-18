#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
destdir="$HOME/bin"

for file in $(ls | grep -E "download|prepare"); do
	echo "$file -> $destdir/$file"
	ln -s "$DIR/$file" "$destdir/$file"
done

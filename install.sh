#!/bin/bash
shopt -s extglob
dir=$( cd $(dirname $0) ; pwd -P )
backup=~/olddotfiles.$(date +"%Y%m%d%H%M%S")

for src in ${dir}/!($(basename $0)|README); do
	file=~/.$(basename "$src")
		
	if [ -e "$file" ]; then
		mkdir -p "$backup"
		mv "$file" "$backup"
	fi
	ln -s "$src" "$file"
done

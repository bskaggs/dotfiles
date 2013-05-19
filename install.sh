#!/bin/bash
shopt -s extglob
dir=$( cd $(dirname $0) ; pwd -P )
backup=~/olddotfiles.$(date +"%Y%m%d%H%M%S")

for src in ${dir}/!($(basename $0)|README.md); do
	file=~/.$(basename "$src")
	
  if [ -L "$file" -a $(readlink "$file") == "$src" ]; then
    echo "Symlink $file already exists and is correct"
  else
    if [ -e "$file" ]; then
      echo "Backing up $file"
      mkdir -p "$backup"
      mv "$file" "$backup"
    fi
    echo "Symlinking $file to $src"
    ln -s "$src" "$file"
  fi
done

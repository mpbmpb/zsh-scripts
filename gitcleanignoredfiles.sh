#!/usr/bin/env bash

set -e
[ -z "$1" ] && commitMsg="removed ignored files" || commitMsg=$1

echo "Remove all files in .gitignore from cache..."
read -p "Are you sure? [Y/n]" -n 1
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    
    git pull
    git rm -rf --cached .
    git add .
    git commit -m "$commitMsg"
    git push

else
    echo "aborted."
fi

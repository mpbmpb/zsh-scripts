#!/usr/bin/env bash

set -e

echo "Throw away all uncommitted changes..."
read -p "Are you sure? [Y/n]" -n 1
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    read -p "Throw away untracked changes as well?" -n 1
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        git clean -fd
    fi
    
    git reset --hard HEAD
    git pull

else
    echo "hard reset aborted."
fi



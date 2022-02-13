#!/usr/bin/env zsh

set -e
[ -z "$2" ] && access="public" || access=$2
[ -z "$3" ] && commitMsg="initial commit" || commitMsg=$3

rm -f .gitignore
source ~/.useraliases
gignore


command git init
command gh repo create "$1" --$access --source=. --remote=origin
command git add .
command git commit -m "$commitMsg"
command git push -u origin main
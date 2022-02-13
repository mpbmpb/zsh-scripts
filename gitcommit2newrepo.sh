#!/usr/bin/env zsh

set -e
[ -z "$2" ] && access="public" || access=$2
[ -z "$3" ] && commitMsg="initial commit" || commitMsg=$3

command git add .
command git commit -m "$commitMsg"
command gh repo create "$1" --$access --source=. --remote=origin
command git push -u origin main
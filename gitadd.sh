set -e

command git pull
command git add .
command git commit -m "$1"
command git push



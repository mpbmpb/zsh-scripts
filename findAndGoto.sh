target=`locate $1 | sed 's,'$1',,' | head -1`
cd "$(echo $target)"

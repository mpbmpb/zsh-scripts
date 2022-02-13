target=`locate $1 | sed 's/'$1'//'`
cd "$(echo $target)"

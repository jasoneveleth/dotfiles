directory=`echo "$@" | grep -o "[A-Za-z0-9%:-]*" | sed "s/%20/ /g"`
outZip="`echo "$directory" | sed "s/ /-/g"`"
#zip -qr "$outZip".zip "$directory"
#zip -qr "$outZip".zip "$directory" --exclude=*img/*
echo "$outZip".zip

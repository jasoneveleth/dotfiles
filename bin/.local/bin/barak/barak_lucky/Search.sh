#clean up background processes
#trap 'kill $(jobs -p)' EXIT
#trap "kill 0" EXIT
#trap "rm -r $playlistdir;echo trying to rmeove directory; exit" SIGTERM
#trap "trap - SIGTERM && kill -- -$$;echo trying it out;rm -r $playlistdir; exit" SIGINT SIGTERM

musicSearch="$1"
playlistdir="$2"
pid=$$

if [ "${#playlistdir}" -eq 0 ];then
	playlistdir="`date +%Y-%m-%d-%H:%M:%S`"
fi


if [ "$#" -eq 0 ]; then 
	echo "updateStatus complete">CMDfifo
	exit
fi

mkdir "$playlistdir" "$playlistdir/img"
IFS=',' read -r -a searches <<< "$musicSearch"

for searchIndex in ${!searches[@]};
do
search="${searches[searchIndex]}"
echo searching $search
soundtrackAlbum=""
lines=[]

	if [[ "${search,,}" = *soundtrack* || "${search,,}" = *album* ]]; then 
		echo "updateStatus $searchIndex;album mode">CMDfifo
		soundtrackLink=`bash ImFeelingLucky2.sh "genius $search"`
		soundtrackAlbum="`FetchSoundtrackAlbum.sh $soundtrackLink`"
		curl -s $soundtrackLink | grep -Eoh 'href="https://genius.com/.{1,100}(lyrics|annotated)["| ]' | tac > $pid.txt
        	links=$pid.txt

		index=0
		while read line ; do
    		link=`echo $line | sed 's/href=//g;s/["]//g'`
    		lines[$index]="$link"
    		index=$(($index+1))
		done < $links

		count=`wc -l $pid.txt | sed "s/$pid.txt//"`

		cat $pid.txt
		rm $pid.txt

		tracknum=1

		for line in "${lines[@]}"; do
    			echo "looking up $line"

    			bash "getsong.sh" "$line" "LOADING" "$playlistdir" "NUM$tracknum"
			echo "updateStatus $searchIndex;$tracknum/$count">CMDfifo
    			tracknum=$((tracknum+1))
		done



		for song in "$playlistdir"/*.m4a; do
		AtomicParsley "$song" --album "$soundtrackAlbum" --overWrite
		done
		echo "updateStatus complete">CMDfifo
	else
		bash "getsong.sh" "$search" "LOADING" "$playlistdir" "searchIndex=$searchIndex"
	fi

done
	echo "playlistdir $n" complete
	echo "updateStatus complete">CMDfifo

	directory=`echo "$playlistdir" | grep -o "[A-Za-z0-9%:-]*" | sed "s/%20/ /g"`
	outZip=`echo "$directory" | sed "s/ /-/g"`
	#zip -qr "$outZip".zip "$directory"
	zip -qr "$outZip".zip "$directory" --exclude=*img/*

